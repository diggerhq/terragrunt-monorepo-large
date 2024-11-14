include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/application/service-1/application/queue-155",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-3/compute/spot-fleet-713",
    "../../../../../../../../us-west-2/dev/finance/platform/service-1/compute/spot-fleet-678",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/network/vpn-943",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-1/network/direct-connect-751",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-733?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-733"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}