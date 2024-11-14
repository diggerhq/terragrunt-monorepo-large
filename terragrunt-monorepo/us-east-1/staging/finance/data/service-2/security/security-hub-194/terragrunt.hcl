include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/application/service-3/compute/spot-fleet-795",
    "../../../../../../../../us-west-2/staging/finance/platform/service-3/network/vpn-485",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/compute/ec2-413",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-194?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-194"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}