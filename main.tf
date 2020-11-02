terraform {
  required_version = ">= 0.12.19"

  required_providers {
    null = ">= 2.1"
    local = ">= 1.2"
    helm = ">= 1.2.3"
  }
}

provider "helm" {}
