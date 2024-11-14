include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/security/certificates-174",
    "../../../../../../../../us-east-1/dev/operations/platform/service-2/network/vpn-676",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-1/network/subnet-240",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-2/monitoring/alertmanager-230",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-227?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-227"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}