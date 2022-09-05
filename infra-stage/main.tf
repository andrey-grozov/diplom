provider "yandex" {
  token     = "${var.yc_token}"
  cloud_id  = "${var.cloud_id}"
  folder_id = "${var.folder_id}"
  zone      = "ru-central1-a"
}

# Linux image
data "yandex_compute_image" "linux" {
  family = "${var.family_image}"
}
# control plane
resource "yandex_compute_instance" "stage-k8s-cp1" {
  name = "stage-k8s-cp1"
  hostname = "stage-k8s-cp1"
  folder_id = var.folder_id

  resources {
    cores  = 2
    core_fraction = 100
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.linux.id 
      size = 20
      type = "network-hdd"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.stage-subnet1.id
#    ip_address = "10.0.0.10"
    nat_ip_address = yandex_vpc_address.ext_addr_cp.external_ipv4_address[0].address
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_pub_key}"
  }

  scheduling_policy {
    preemptible = true
  }
}
# нода 1
resource "yandex_compute_instance" "stage-k8s-node1" {
  name = "stage-k8s-node1"
  hostname = "stage-k8s-node1"
  folder_id = var.folder_id
  zone           = "ru-central1-a"

  resources {
    cores  = 2
    core_fraction = 100
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.linux.id
      size = 20
      type = "network-hdd"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.stage-subnet1.id
#    ip_address = "10.0.0.11"
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_pub_key}"
  }

  scheduling_policy {
    preemptible = true
  }
}

# нода 2
resource "yandex_compute_instance" "stage-k8s-node2" {
  name = "stage-k8s-node2"
  hostname = "stage-k8s-node2"
  folder_id = var.folder_id
  zone           = "ru-central1-b"

  resources {
    cores  = 2
    core_fraction = 100
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.linux.id
      size = 20
      type = "network-hdd"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.stage-subnet2.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_pub_key}"
  }

  scheduling_policy {
    preemptible = true
  }
}

# нода 3
resource "yandex_compute_instance" "stage-k8s-node3" {
  name = "stage-k8s-node3"
  hostname = "stage-k8s-node3"
  folder_id = var.folder_id
  zone           = "ru-central1-c"

  resources {
    cores  = 2
    core_fraction = 100
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.linux.id
      size = 20
      type = "network-hdd"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.stage-subnet3.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_pub_key}"
  }

  scheduling_policy {
    preemptible = true
  }
}



