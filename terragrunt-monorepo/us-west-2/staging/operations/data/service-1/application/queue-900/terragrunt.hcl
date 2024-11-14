include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/platform/service-3/storage/elasticache-923",
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/monitoring/log-aggregation-133",
    "../../../../../../../../us-east-1/qa/operations/application/service-3/network/vpn-905",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-900?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-900"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}