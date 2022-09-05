#Variables discription
#yc_token from TF_VAR_yc_token
variable "yc_token" {
  description = "Yandex Cloud token"
  type        = string
  }

variable "cloud_id" {
  description = "Yandex Cloud id"
  type = string
  default = "b1gm3i0j5l43veldtm5i"
}

variable "folder_id" {
  description = "Yandex Cloud id"
  type = string
  default = "b1gqmi5sb6pvh973ej6o"
}

# set by TFC only
variable "tfc_workspace_name" {
  type    = string
  default = "stage"
}
                  
variable "kube-cluster" {
  description = "kubernetes cluster name"
  type = string
  default = "kube-cluster"
}

variable "family_image" {
  description = "computer family image name"
  type = string
  default = "ubuntu-2004-lts"
}

variable "vpc_netname" {
  description = "vpc network name"
  type = string
  default = "vpc-diplom"
}

variable "ssh_pub_key" {
  description = "ssh pub key for hosts"
  type = string
}
