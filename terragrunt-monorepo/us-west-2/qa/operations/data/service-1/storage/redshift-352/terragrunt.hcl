include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/application/cache-layer-9",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-1/monitoring/trace-collection-95",
    "../../../../../../../../us-east-1/qa/operations/application/service-2/security/waf-670",
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/network/transit-gateway-506",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-2/application/queue-156",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-352?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-352"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}