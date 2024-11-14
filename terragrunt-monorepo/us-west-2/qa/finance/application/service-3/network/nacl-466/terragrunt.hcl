include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/data/service-3/compute/fargate-630",
    "../../../../../../../../us-east-1/staging/finance/platform/service-2/application/api-gateway-640",
    "../../../../../../../../us-east-1/staging/operations/platform/service-3/compute/spot-fleet-845",
    "../../../../../../../../us-east-1/dev/marketing/application/service-3/security/secrets-605",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//nacl-466?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "nacl-466"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}