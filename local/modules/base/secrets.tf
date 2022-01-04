resource "helm_release" "secrets" {
  depends_on = [
    helm_release.namespaces
  ]
  name = "secrets"
  chart = "${var.project_root}/secrets"
}
