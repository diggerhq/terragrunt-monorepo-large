include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/application/service-3/monitoring/trace-collection-865",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-3/security/waf-182",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/network/endpoint-606",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/application/cache-layer-376",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-802?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-802"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}