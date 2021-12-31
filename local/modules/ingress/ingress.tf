provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
    config_context = "docker-desktop"
  }
}

variable "namespaces_id" {
  type = string
}

variable "secrets_id" {
  type = string
}

locals {
  project_root = "${path.root}/../.."
}

resource "helm_release" "ingress" {
  name = "ingress"
  chart = "${local.project_root}/ingress"
  namespace = "services"
}
