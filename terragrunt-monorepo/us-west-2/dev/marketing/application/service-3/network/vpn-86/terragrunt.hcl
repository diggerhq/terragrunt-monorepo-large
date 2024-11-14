include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/application/service-1/network/nacl-26",
    "../../../../../../../../us-west-2/qa/operations/platform/service-3/network/subnet-400",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-2/monitoring/trace-collection-480",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-2/network/vpn-417",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-86?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-86"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}