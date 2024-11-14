include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/storage/rds-51",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/network/transit-gateway-799",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-3/compute/batch-130",
    "../../../../../../../../us-west-2/staging/finance/application/service-3/compute/batch-960",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-493?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-493"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}