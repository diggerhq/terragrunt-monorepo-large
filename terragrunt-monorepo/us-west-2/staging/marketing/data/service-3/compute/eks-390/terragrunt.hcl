include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/platform/service-1/network/subnet-240",
    "../../../../../../../../us-west-2/dev/operations/application/service-1/security/secrets-699",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/application/event-bus-483",
    "../../../../../../../../us-west-2/qa/marketing/application/service-2/network/subnet-407",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-390?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-390"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}