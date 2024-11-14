include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/network/nacl-149",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-2/monitoring/log-aggregation-469",
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/application/service-mesh-509",
    "../../../../../../../../us-west-2/qa/operations/platform/service-3/monitoring/alertmanager-138",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-930?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-930"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}