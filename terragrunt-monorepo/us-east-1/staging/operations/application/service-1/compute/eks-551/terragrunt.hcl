include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/application/event-bus-42",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-2/network/vpn-487",
    "../../../../../../../../us-west-2/dev/finance/data/service-3/application/queue-920",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-551?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-551"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}