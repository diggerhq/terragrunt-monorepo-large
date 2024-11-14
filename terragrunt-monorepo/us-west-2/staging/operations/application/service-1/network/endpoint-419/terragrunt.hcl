include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/application/service-3/network/vpc-849",
    "../../../../../../../../us-west-2/dev/operations/data/service-3/compute/batch-74",
    "../../../../../../../../us-east-1/staging/finance/platform/service-3/compute/batch-933",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-419?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-419"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}