include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/data/service-2/network/transit-gateway-972",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/monitoring/log-aggregation-674",
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/security/certificates-378",
    "../../../../../../../../eu-west-1/staging/operations/data/service-3/storage/elasticache-480",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-374?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-374"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}