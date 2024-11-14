include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/application/api-gateway-697",
    "../../../../../../../../us-west-2/staging/finance/platform/service-2/compute/auto-scaling-443",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/application/api-gateway-284",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-625?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-625"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}