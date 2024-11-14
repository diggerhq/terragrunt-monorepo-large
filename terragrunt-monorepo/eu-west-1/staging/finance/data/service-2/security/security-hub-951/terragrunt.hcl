include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/platform/service-2/network/vpn-417",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-1/network/vpn-676",
    "../../../../../../../../us-west-2/qa/finance/platform/service-2/application/service-mesh-216",
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/security/certificates-378",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-951?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-951"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}