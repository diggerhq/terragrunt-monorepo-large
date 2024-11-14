include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/compute/auto-scaling-938",
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/compute/lambda-213",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-3/storage/fsx-988",
    "../../../../../../../../us-west-2/qa/marketing/application/service-1/monitoring/grafana-664",
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/monitoring/cloudwatch-658",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-176?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-176"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}