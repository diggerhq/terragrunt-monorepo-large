include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/platform/service-1/application/cache-layer-475",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-3/compute/fargate-802",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-1/compute/batch-972",
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/network/vpn-867",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//iam-989?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "iam-989"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}