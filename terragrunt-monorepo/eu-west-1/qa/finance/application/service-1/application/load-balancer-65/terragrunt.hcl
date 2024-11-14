include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/data/service-3/compute/batch-562",
    "../../../../../../../../us-east-1/qa/operations/platform/service-2/monitoring/cloudwatch-970",
    "../../../../../../../../us-west-2/staging/operations/platform/service-3/network/subnet-382",
    "../../../../../../../../us-east-1/dev/operations/data/service-2/security/shield-890",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-65?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-65"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}