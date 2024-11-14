include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/compute/batch-208",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/network/transit-gateway-277",
    "../../../../../../../../us-west-2/dev/finance/application/service-2/network/transit-gateway-130",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-430?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-430"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}