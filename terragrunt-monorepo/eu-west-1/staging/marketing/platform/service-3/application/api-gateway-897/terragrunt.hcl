include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/security/security-hub-951",
    "../../../../../../../../us-west-2/dev/finance/data/service-2/application/load-balancer-931",
    "../../../../../../../../us-east-1/qa/finance/data/service-2/security/secrets-951",
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/network/transit-gateway-657",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-1/storage/efs-369",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-897?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-897"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}