include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/data/service-1/application/event-bus-682",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/security/certificates-715",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-1/compute/spot-fleet-553",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-145?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-145"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}