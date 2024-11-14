include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-1/monitoring/trace-collection-95",
    "../../../../../../../../eu-west-1/dev/finance/application/service-3/network/nacl-273",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/security/security-hub-530",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-605?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-605"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}