module "base" {
  source = "./modules/base"
}

module "kafka" {
  source = "./modules/kafka"
  # forced dependencies 
  secrets_id = module.base.secrets_release_id
  namespaces_id = module.base.namespaces_release_id
}

module "observability" {
  source = "./modules/observability"
  # forced dependencies 
  secrets_id = module.base.secrets_release_id
  namespaces_id = module.base.namespaces_release_id
}

module "ingress" {
  source = "./modules/ingress"
  # forced dependencies 
  secrets_id = module.base.secrets_release_id
  namespaces_id = module.base.namespaces_release_id
}

module "services" {
  source = "./modules/services"
  namespaces_release_id = module.base.namespaces_release_id
  secrets_release_id = module.base.secrets_release_id
}
