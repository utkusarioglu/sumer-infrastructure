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
  namespace = "observability"
}

resource "helm_release" "grafana" {
  name = "grafana"
  chart = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  version = "6.20.3"
  namespace = local.namespace
  dependency_update = true

  set {
    name = "service.port"
    value = 9000
  }
}

resource "helm_release" "prometheus" {
  name = "prometheus"
  chart = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  version = "15.0.2"
  namespace = local.namespace
  dependency_update = true

  set {
    name = "nodeExporter.enabled"
    value = false
  }
}

# resource "helm_release" "jaeger" {
#   name = "jaeger"
#   chart = "jaeger"
#   repository = "https://jaegertracing.github.io/helm-charts"
#   version = "0.51.5"
#   dependency_update = true
#   namespace = local.namespace
# }
