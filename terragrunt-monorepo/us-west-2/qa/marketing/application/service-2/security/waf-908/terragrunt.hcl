include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/compute/ec2-29",
    "../../../../../../../../us-east-1/staging/finance/data/service-3/network/nacl-195",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/security/security-hub-951",
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/security/waf-729",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-908?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-908"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}