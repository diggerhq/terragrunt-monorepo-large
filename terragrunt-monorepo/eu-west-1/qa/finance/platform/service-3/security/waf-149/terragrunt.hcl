include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/platform/service-1/application/cache-layer-803",
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/storage/s3-305",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/network/nacl-72",
    "../../../../../../../../us-east-1/qa/operations/application/service-3/network/transit-gateway-332",
    "../../../../../../../../us-east-1/dev/finance/application/service-2/monitoring/log-aggregation-884",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-149?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-149"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}