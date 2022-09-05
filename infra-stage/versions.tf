terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.73.0"
    }
  }

  cloud {
    organization = "grav-org"
    hostname     = "app.terraform.io"
    
    # TFC workspaces for this project
    workspaces {
      name = "stage"
    }
  }
}
