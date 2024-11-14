include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/application/service-1/network/transit-gateway-36",
    "../../../../../../../../us-west-2/qa/marketing/application/service-2/network/transit-gateway-556",
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/security/certificates-928",
    "../../../../../../../../us-west-2/dev/finance/platform/service-1/security/kms-758",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-2/security/waf-179",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-316?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-316"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}