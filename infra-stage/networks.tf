# network VPC
resource "yandex_vpc_network" "stage-net" {
  name = "${var.vpc_netname}"
}

# subnet 1
resource "yandex_vpc_subnet" "stage-subnet1" {

  v4_cidr_blocks = ["192.168.10.0/24"]
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.stage-net.id}"
  name 		 = "stage-subnet1"
}

# subnet 2
resource "yandex_vpc_subnet" "stage-subnet2" {

  v4_cidr_blocks = ["192.168.20.0/24"]
  zone           = "ru-central1-b"
  network_id     = "${yandex_vpc_network.stage-net.id}"
  name 		 = "stage-subnet2"
}

# sybnet 3
resource "yandex_vpc_subnet" "stage-subnet3" {

  v4_cidr_blocks = ["192.168.30.0/24"]
  zone           = "ru-central1-c"
  network_id     = "${yandex_vpc_network.stage-net.id}"
  name 		 = "stage-subnet3"
}

# external permanent ip for  control plane
resource "yandex_vpc_address" "ext_addr_cp" {
  name = "Control Plane Public IP"
  external_ipv4_address {
    zone_id = "ru-central1-a"
  }
}
