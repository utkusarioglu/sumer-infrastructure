resource "helm_release" "namespaces" {
  name = "namespaces"
  chart = "${var.project_root}/namespaces"
}

resource "helm_release" "secrets" {
  depends_on = [
    helm_release.namespaces
  ]
  name = "secrets"
  chart = "${var.project_root}/secrets"
}
