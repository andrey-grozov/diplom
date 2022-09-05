# diplom

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

spadmin@ubuntu:/$ kubectl get pods --all-namespaces 
NAMESPACE       NAME                              READY   STATUS    RESTARTS   AGE
ingress-nginx   ingress-nginx-controller-bmfrd    1/1     Running   0          82m
ingress-nginx   ingress-nginx-controller-dzhh6    1/1     Running   0          82m
ingress-nginx   ingress-nginx-controller-f7cfn    1/1     Running   0          82m
kube-system     calico-node-d2cns                 1/1     Running   0          84m
kube-system     calico-node-q26l8                 1/1     Running   0          84m
kube-system     calico-node-vn9m2                 1/1     Running   0          84m
kube-system     calico-node-x7464                 1/1     Running   0          84m
kube-system     coredns-59d6b54d97-4q8tz          1/1     Running   0          80m
kube-system     coredns-59d6b54d97-nfczs          1/1     Running   0          80m
kube-system     dns-autoscaler-78676459f6-s2wp4   1/1     Running   0          80m
kube-system     kube-apiserver-cp0                1/1     Running   1          89m
kube-system     kube-controller-manager-cp0       1/1     Running   1          89m
kube-system     kube-proxy-926b8                  1/1     Running   0          86m
kube-system     kube-proxy-g8mcg                  1/1     Running   0          86m
kube-system     kube-proxy-x7xg4                  1/1     Running   0          86m
kube-system     kube-proxy-z744q                  1/1     Running   0          86m
kube-system     kube-scheduler-cp0                1/1     Running   1          89m
kube-system     nginx-proxy-node0                 1/1     Running   0          86m
kube-system     nginx-proxy-node1                 1/1     Running   0          86m
kube-system     nginx-proxy-node2                 1/1     Running   0          86m
kube-system     nodelocaldns-bc7rq                1/1     Running   0          80m
kube-system     nodelocaldns-bvfqm                1/1     Running   0          80m
kube-system     nodelocaldns-cmvp9                1/1     Running   0          80m
kube-system     nodelocaldns-ctkbx                1/1     Running   0          80m

root@ubuntu:~# kubectl get po
NAME                                                     READY   STATUS    RESTARTS   AGE
alertmanager-prometheus-kube-prometheus-alertmanager-0   2/2     Running   0          82s
prometheus-grafana-59dc6b9db7-sf7ff                      3/3     Running   0          89s
prometheus-kube-prometheus-operator-fcff8f48b-hdlzq      1/1     Running   0          89s
prometheus-kube-state-metrics-668449846c-gpjhw           1/1     Running   0          89s
prometheus-prometheus-kube-prometheus-prometheus-0       2/2     Running   0          81s
prometheus-prometheus-node-exporter-6dcdj                1/1     Running   0          89s
prometheus-prometheus-node-exporter-gk7rh                1/1     Running   0          89s
prometheus-prometheus-node-exporter-tzzcs                1/1     Running   0          89s
prometheus-prometheus-node-exporter-vlnj8                1/1     Running   0          89s
