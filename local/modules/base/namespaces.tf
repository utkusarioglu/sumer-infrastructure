resource "helm_release" "namespaces" {
  name = "namespaces"
  chart = "${local.project_root}/namespaces"
}

output "namespaces_release_id" {
  value = helm_release.namespaces.id
}
