resource "helm_release" "secrets" {
  depends_on = [
    helm_release.namespaces
  ]
  name = "secrets"
  chart = "${local.project_root}/secrets"
}

output "secrets_release_id" {
  value = helm_release.secrets.id
}
