include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/application/service-3/network/subnet-288",
    "../../../../../../../../us-east-1/dev/finance/application/service-1/security/guardduty-675",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/network/subnet-407",
    "../../../../../../../../us-west-2/qa/operations/platform/service-3/network/subnet-400",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-113?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-113"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}