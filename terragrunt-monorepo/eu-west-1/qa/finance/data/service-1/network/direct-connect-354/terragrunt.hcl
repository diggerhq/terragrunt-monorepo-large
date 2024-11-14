include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-3/network/vpn-556",
    "../../../../../../../../us-east-1/dev/marketing/application/service-2/security/iam-663",
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/application/load-balancer-449",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/application/api-gateway-25",
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/security/shield-167",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-354?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-354"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}