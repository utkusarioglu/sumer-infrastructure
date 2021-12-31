provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
    config_context = "docker-desktop"
  }
}

locals {
  project_root = "${path.root}/../.."
}
