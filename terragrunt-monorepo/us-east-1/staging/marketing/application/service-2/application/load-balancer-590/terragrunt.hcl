include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/platform/service-2/security/certificates-941",
    "../../../../../../../../eu-west-1/qa/operations/application/service-1/application/cache-layer-217",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/security/guardduty-138",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/application/cache-layer-722",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-590?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-590"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}