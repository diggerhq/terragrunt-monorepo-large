include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/application/service-1/storage/efs-390",
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/application/cache-layer-114",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/application/api-gateway-226",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-551?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-551"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}