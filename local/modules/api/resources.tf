resource "helm_release" "ingress" {
  name = "ingress"
  chart = "${var.project_root}/ingress"
  namespace = local.namespace
  dependency_update = true
}

resource "helm_release" "ethereum_dispatcher" {
  name = "ethereum-dispatcher"
  chart = "${var.project_root}/ethereum-dispatcher/helm"
  namespace = local.namespace
  cleanup_on_fail = true
  dependency_update = true

  set {
    name = "image.tag"
    value = local.image_tag
  }
  set {
    name = "image.pullPolicy"
    value = "Never"
  }

  set {
    name = "kafkaConsumerIcImage.tag"
    value = local.image_tag
  }

  set {
    name = "kafkaConsumerIcImage.pullPolicy"
    value = "Never"
  }
  
  set {
    name = "envIcImage.tag"
    value = local.image_tag
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
    name = "network"
    value = "goerli"
  }

  set {
    name = "logLevel"
    value = "debug"
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

resource "helm_release" "rest_gateway" {
  name = "rest-gateway"
  chart = "${var.project_root}/rest-gateway/helm"
  namespace = local.namespace
  cleanup_on_fail = true
  dependency_update = true

  set {
    name = "image.tag"
    value = local.image_tag
  }  
  set {
    name = "image.pullPolicy"
    value = "Never"
  }

  set {
    name = "kafkaConsumerIcImage.tag"
    value = local.image_tag
  }
  set {
    name = "kafkaConsumerIcImage.pullPolicy"
    value = "Never"
  }
  
  set {
    name = "envIcImage.tag"
    value = local.image_tag
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

resource "helm_release" "web_dapp" {
  name = "web-dapp"
  chart = "${var.project_root}/web-dapp/helm"
  namespace = local.namespace
  cleanup_on_fail = true
  dependency_update = true

  set {
    name = "image.tag"
    value = local.image_tag
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

resource "helm_release" "websocket_gateway" {
  name = "websocket-gateway"
  chart = "${var.project_root}/websocket-gateway/helm" 
  namespace = local.namespace
  cleanup_on_fail = true
  dependency_update = true

  set {
    name = "image.tag"
    value = local.image_tag
  }
  set {
    name = "image.pullPolicy"
    value = "Never"
  }

  set {
    name = "kafkaConsumerIcImage.tag"
    value = local.image_tag
  }
  set {
    name = "kafkaConsumerIcImage.pullPolicy"
    value = "Never"
  }
  
  set {
    name = "envIcImage.tag"
    value = local.image_tag
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

    name = "corsOrigin"
    value = "localhost"
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
