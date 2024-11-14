include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/application/service-2/monitoring/grafana-45",
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/network/direct-connect-564",
    "../../../../../../../../eu-west-1/qa/operations/application/service-3/storage/dynamodb-115",
    "../../../../../../../../us-west-2/dev/finance/data/service-2/application/load-balancer-931",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-736?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-736"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}