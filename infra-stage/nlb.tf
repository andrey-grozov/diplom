resource "yandex_lb_target_group" "targetgroup01" {
  name      = "targetgroup01"

  target {
    subnet_id = yandex_vpc_subnet.stage-subnet1.id
    address = "${yandex_compute_instance.stage-k8s-node1.network_interface.0.ip_address}"
  }

  target {
    subnet_id = yandex_vpc_subnet.stage-subnet2.id
    address = "${yandex_compute_instance.stage-k8s-node2.network_interface.0.ip_address}"
  }

  target {
    subnet_id = yandex_vpc_subnet.stage-subnet3.id
    address = "${yandex_compute_instance.stage-k8s-node3.network_interface.0.ip_address}"
  }
}

resource "yandex_lb_network_load_balancer" "nw-balancer" {
  name = "my-network-load-balancer"

  listener {
    name = "my-listener"
    port = 80
    target_port=30001
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = "${yandex_lb_target_group.targetgroup01.id}"

    healthcheck {
      name = "http"
      http_options {
        port = 30001
        path = "/"
      }
    }
  }
}