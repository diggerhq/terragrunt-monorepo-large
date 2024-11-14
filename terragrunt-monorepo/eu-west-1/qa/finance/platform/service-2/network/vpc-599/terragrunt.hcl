include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/compute/lambda-292",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-1/monitoring/log-aggregation-391",
    "../../../../../../../../eu-west-1/dev/finance/application/service-3/network/transit-gateway-805",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-599?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-599"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}