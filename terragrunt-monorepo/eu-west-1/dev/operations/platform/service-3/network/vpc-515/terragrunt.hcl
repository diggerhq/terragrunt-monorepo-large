include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/network/vpn-493",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/security/certificates-631",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-515?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-515"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}