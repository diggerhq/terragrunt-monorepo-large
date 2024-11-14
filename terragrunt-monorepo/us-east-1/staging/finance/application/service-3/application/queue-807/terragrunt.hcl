include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/application/service-2/network/vpn-215",
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/storage/elasticache-319",
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/monitoring/log-aggregation-264",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-807?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-807"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}