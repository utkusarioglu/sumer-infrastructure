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

variable "kafka_consumer_ic_image_tag" {
  type = string
  default = "tf"
}

variable "env_ic_image_tag" {
  type = string
  default = "tf"
}

variable "namespace" {
  type = string
}

locals {
  repo_name = "rest-gateway"
  project_root = "${path.root}/../.."
  repo_path = "${local.project_root}/${local.repo_name}"
}

resource "helm_release" "rest_gateway" {
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
    name = "kafkaConsumerIcImage.tag"
    value = var.kafka_consumer_ic_image_tag
  }
  set {
    name = "kafkaConsumerIcImage.pullPolicy"
    value = "Never"
  }
  
  set {
    name = "envIcImage.tag"
    value = var.env_ic_image_tag
  }
  set {
    name = "envIcImage.pullPolicy"
    value = "Never"
  }

  set {
    name = "kafkaBrokers"
    value = "sumer-kafka-brokers.kafka:9092"  
  }

  set {
    name = "replicaCount"
    value = 1
  }

  set {
    name = "logLevel"
    value = "info"
  }

  # set {
  #   name = "varsToCheck"
  #   value = "NODE_ENV,LOG_LEVEL"
  # }

  # set {
  #   name = "restartTimeout"
  #   value = 6000
  # }
}
