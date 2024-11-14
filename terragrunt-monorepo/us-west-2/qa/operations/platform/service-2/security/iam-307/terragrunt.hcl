include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/security/secrets-350",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/application/api-gateway-516",
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/application/load-balancer-56",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/application/cache-layer-195",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//iam-307?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "iam-307"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}