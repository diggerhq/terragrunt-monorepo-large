include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/monitoring/cloudwatch-105",
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/storage/dynamodb-181",
    "../../../../../../../../us-west-2/qa/marketing/application/service-3/application/event-bus-697",
    "../../../../../../../../us-east-1/qa/finance/data/service-1/monitoring/grafana-485",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-206?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-206"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}