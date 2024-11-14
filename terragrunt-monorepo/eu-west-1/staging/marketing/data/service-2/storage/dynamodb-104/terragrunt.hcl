include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/network/transit-gateway-939",
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/compute/lambda-290",
    "../../../../../../../../us-east-1/dev/finance/platform/service-3/compute/auto-scaling-335",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-104?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-104"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}