include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/application/service-mesh-784",
    "../../../../../../../../us-west-2/staging/operations/platform/service-1/storage/dynamodb-584",
    "../../../../../../../../us-west-2/dev/finance/data/service-1/application/load-balancer-179",
    "../../../../../../../../eu-west-1/dev/operations/data/service-1/compute/lambda-105",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-352?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-352"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}