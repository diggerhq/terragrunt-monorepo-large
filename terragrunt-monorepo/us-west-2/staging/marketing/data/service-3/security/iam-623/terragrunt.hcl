include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/application/load-balancer-749",
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/application/cache-layer-233",
    "../../../../../../../../us-west-2/qa/marketing/data/service-1/compute/lambda-177",
    "../../../../../../../../us-west-2/staging/operations/application/service-3/network/transit-gateway-787",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//iam-623?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "iam-623"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}