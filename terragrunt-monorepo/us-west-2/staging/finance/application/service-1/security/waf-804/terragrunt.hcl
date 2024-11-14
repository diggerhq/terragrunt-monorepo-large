include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/application/service-3/compute/spot-fleet-149",
    "../../../../../../../../us-west-2/dev/finance/application/service-1/storage/s3-619",
    "../../../../../../../../us-east-1/qa/finance/platform/service-1/network/vpn-515",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/security/waf-563",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/storage/elasticache-84",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-804?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-804"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}