include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/application/service-1/storage/elasticache-269",
    "../../../../../../../../us-east-1/dev/operations/data/service-3/compute/fargate-658",
    "../../../../../../../../us-east-1/dev/finance/platform/service-3/application/load-balancer-213",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-347?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-347"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}