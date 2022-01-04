resource "helm_release" "namespaces" {
  name = "namespaces"
  chart = "${var.project_root}/namespaces"
}
