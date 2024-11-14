include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/platform/service-1/network/nacl-22",
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/application/load-balancer-925",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/monitoring/grafana-935",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//elasticache-854?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "elasticache-854"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}