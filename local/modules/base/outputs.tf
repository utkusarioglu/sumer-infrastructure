output "namespaces_release_id" {
  value = helm_release.namespaces.id
}

output "secrets_release_id" {
  value = helm_release.secrets.id
}
