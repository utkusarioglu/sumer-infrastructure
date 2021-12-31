variable "namespaces_release_id" {
  type = string
}

variable "secrets_release_id" {
  type = string
}

module "ethereum_dispatcher" {
  source = "../services-modules/ethereum-dispatcher"
  namespace = "services"
  secrets_id = var.secrets_release_id
  namespaces_id = var.namespaces_release_id
}

module "websocket_gateway" {
  source = "../services-modules/websocket-gateway"
  namespace = "services"
  secrets_id = var.secrets_release_id
  namespaces_id = var.namespaces_release_id
}

module "web_dapp" {
  source = "../services-modules/web-dapp"
  namespace = "services"
  secrets_id = var.secrets_release_id
  namespaces_id = var.namespaces_release_id
}

module "rest_gateway" {
  source = "../services-modules/rest-gateway"
  namespace = "services"
  secrets_id = var.secrets_release_id
  namespaces_id = var.namespaces_release_id
}
