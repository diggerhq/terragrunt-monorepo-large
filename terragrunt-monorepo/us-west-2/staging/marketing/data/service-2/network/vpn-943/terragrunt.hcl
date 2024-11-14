include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/network/endpoint-719",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/network/subnet-912",
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/compute/batch-165",
    "../../../../../../../../eu-west-1/qa/operations/application/service-3/compute/ec2-951",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-943?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-943"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}