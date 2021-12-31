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
  repo_name = "ingress"
  project_root = "${path.root}/../.."
  repo_path = "${local.project_root}/${local.repo_name}"
}

resource "helm_release" "ingress" {
  name = local.repo_name
  chart = "${local.repo_path}/helm"
  namespace = "services"
}
