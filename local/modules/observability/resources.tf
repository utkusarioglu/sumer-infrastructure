resource "helm_release" "grafana" {
  name = "grafana"
  chart = "${var.project_root}/grafana"
  namespace = "api"
  dependency_update = true
  cleanup_on_fail = true
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

resource "helm_release" "jaeger" {
  name = "jaeger"
  chart = "jaeger"
  repository = "https://jaegertracing.github.io/helm-charts"
  version = "0.51.5"
  dependency_update = true
  namespace = local.namespace
}

resource "helm_release" "metrics_storage" {
  name = "metrics-storage"
  chart = "${var.project_root}/metrics-storage"
  namespace = local.namespace
  dependency_update = true
  cleanup_on_fail = true
}
