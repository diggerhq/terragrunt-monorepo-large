include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/data/service-1/application/event-bus-153",
    "../../../../../../../../us-east-1/qa/marketing/application/service-3/security/kms-500",
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/security/certificates-444",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-1/network/vpn-676",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-553?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-553"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}