include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/platform/service-2/monitoring/prometheus-878",
    "../../../../../../../../us-east-1/dev/operations/application/service-3/monitoring/grafana-884",
    "../../../../../../../../us-west-2/qa/operations/platform/service-2/storage/dynamodb-65",
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/monitoring/grafana-623",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//lambda-800?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "lambda-800"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}