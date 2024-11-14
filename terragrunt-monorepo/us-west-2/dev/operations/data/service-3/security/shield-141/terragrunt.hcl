include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/platform/service-3/application/api-gateway-664",
    "../../../../../../../../eu-west-1/qa/operations/application/service-3/monitoring/alertmanager-945",
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/network/subnet-795",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-3/security/iam-571",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-141?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-141"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}