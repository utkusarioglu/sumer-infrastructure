provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
    config_context = "docker-desktop"
  }
}

variable "image_tag" {
  type = string
  default = "tf"
}

variable "secrets_id" {
  type = string
}
variable "namespaces_id" {
  type = string
}

variable "namespace" {
  type = string
}

locals {
  repo_name = "web-dapp"
  project_root = "${path.root}/../.."
  repo_path = "${local.project_root}/${local.repo_name}"
  image_port = "4000"
}

resource "helm_release" "web_dapp" {
  name = local.repo_name
  chart = "${local.repo_path}/helm"
  namespace = var.namespace
  cleanup_on_fail = true
  dependency_update = true

  set {
    name = "image.tag"
    value = var.image_tag
  }

  set {
    name = "image.pullPolicy"
    value = "Never"
  }

  set {
    name = "replicaCount"
    value = 1
  }
}
