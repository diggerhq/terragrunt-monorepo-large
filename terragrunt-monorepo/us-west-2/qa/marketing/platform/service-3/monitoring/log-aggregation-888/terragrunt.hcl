include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/storage/elasticache-319",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/application/api-gateway-877",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-2/security/security-hub-891",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-1/network/vpn-971",
    "../../../../../../../../us-west-2/staging/operations/application/service-1/application/event-bus-422",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-888?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-888"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}