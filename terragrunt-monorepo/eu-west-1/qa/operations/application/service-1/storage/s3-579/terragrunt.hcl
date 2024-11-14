include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/data/service-1/security/kms-457",
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/network/transit-gateway-497",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/application/event-bus-898",
    "../../../../../../../../us-west-2/qa/operations/data/service-3/application/load-balancer-805",
    "../../../../../../../../us-west-2/staging/operations/platform/service-2/application/api-gateway-679",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//s3-579?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "s3-579"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}