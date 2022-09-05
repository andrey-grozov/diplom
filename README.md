# Дипломный проект

## Этапы выполнения:

### 1. Создание облачной инфраструктуры

Создали сервис аккаунт для работы терраформа с яндексом

    spadmin@ubuntu:/mnt/gitwork/diplom$ yc iam service-account get sa-terraform
    id: ajeu8bb2cetrebe8hn8h
    folder_id: b1gkbns08b4t6ihbvua8
    created_at: "2022-08-09T04:14:25Z"
    name: sa-terraform
    description: terraform service account

Определяем окружение для инициализации терраформ
export TF_TOKEN_app_terraform_io=

Добавляем переменную для ssh pub key хостов
export TF_VAR_ssh_pub_key=

Создали backend для Terraform

![Создали backend для Terraform](./img/terraform.png)

Создали виртуальные машины

![Виртуальные машины](./img/kubecluster.png)

### 2. Создание Kubernetes кластера

Для создание кластера используем Kubespray
[инвентарь находится здесь](./infra-stage/kubespray/inventory/mycluster/)

    ansible-playbook -i kubespray/inventory/mycluster/hosts-stage.yaml kubespray/cluster.yml -b -v

Результаты создания кластера
![кластер](img/kubecluster1.png)

Результат выполнения команды kubectl get pods --all-namespaces
![kubectl](./img/kubectl_get_po.png)


### 3. Создание тестового приложения

Приложение создано на базе `nginx:stable` с измененной индексной страницей.

[ссылка на приложение](https://github.com/andrey-grozov/testapp)

Сохраняем приложение в dockerhub
![dockerhub](./img/docker-hub.png)


### 4. Подготовка cистемы мониторинга и деплой приложения

Систему мониторинга устанавливаем при помощи helm чартов.
Добавим репозиторий helm

    helm repo add stable https://charts.helm.sh/stable

и prometheus

    helm repo add prometheus-community https://prometheus-community.github.io/helm-charts


установим систему 

    helm install prometheus prometheus-community/kube-prometheus-stack

По умолчанию служба grafana доступны в кластере с использованием типа ClusterIP, для доступа к ним извне изменим тип на NodePort.

kubectl edit svc prometheus-grafana

Проверим работу grafana
![grafana](./img/grafana.png)


Организации конфигурации: qbec

В конфигурация qbec поддерживается два окружения - `stage` и `prod`. 

Деплоим в stage
![qbec](./img/qbec.png)

Проверяем работу после деплоя приложения

![deploy_app](./img/testapp_deploy.png)



### 5. Установка и настройка CI/CD
Согласно заданию:
- при любом коммите происходит сборка Докер-образа и отправка его в наш облачный registry.
- при создании Git-тега на образ Докера навешиваются дополнительно теги `:<имя-git-тега>` и `stable`, а приложение 
деплоится (в stage-окружение).



