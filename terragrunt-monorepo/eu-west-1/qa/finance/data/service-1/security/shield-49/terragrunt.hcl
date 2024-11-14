include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/platform/service-3/storage/redshift-918",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/application/api-gateway-487",
    "../../../../../../../../us-east-1/staging/operations/application/service-2/storage/elasticache-204",
    "../../../../../../../../us-east-1/qa/finance/data/service-2/monitoring/grafana-668",
    "../../../../../../../../us-west-2/staging/finance/data/service-3/storage/backup-594",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-49?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-49"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}