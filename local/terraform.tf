locals {
  project_root = "${path.root}/../.."
}

module "base" {
  source = "./modules/base"
  project_root = local.project_root
}

module "kafka" {
  source = "./modules/kafka"
  project_root = local.project_root
  # forced dependencies 
  secrets_id = module.base.secrets_release_id
  namespaces_id = module.base.namespaces_release_id
}

module "observability" {
  source = "./modules/observability"
  project_root = local.project_root
  # forced dependencies 
  secrets_id = module.base.secrets_release_id
  namespaces_id = module.base.namespaces_release_id
}

module "api" {
  source = "./modules/api"
  project_root = local.project_root
  # forced dependencies 
  namespaces_id = module.base.namespaces_release_id
  secrets_id = module.base.secrets_release_id
}
