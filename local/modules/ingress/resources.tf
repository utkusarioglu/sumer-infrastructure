resource "helm_release" "ingress" {
  name = "ingress"
  chart = "${var.project_root}/ingress"
  namespace = "services"
  dependency_update = true
}
