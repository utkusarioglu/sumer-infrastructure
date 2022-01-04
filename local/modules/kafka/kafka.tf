provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
    config_context = "docker-desktop"
  }
}

locals {
  project_root = "${path.root}/../.."
}

variable "namespaces_id" {
  type = string
}

variable "secrets_id" {
  type = string
}

resource "helm_release" "kafka" {
  name = "kafka"
  chart = "${local.project_root}/kafka"
  namespace = "kafka"
  dependency_update = true
  
  set {
    name = "kafkaReplicas"
    value = 1
  }

  set {
    name = "zookeeperReplicas"
    value = 1
  }

  set {
    name = "kafkaConnectReplicas"
    value = 1
  }
}
