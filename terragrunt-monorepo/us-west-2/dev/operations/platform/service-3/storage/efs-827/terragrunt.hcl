include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/platform/service-1/monitoring/log-aggregation-922",
    "../../../../../../../../us-east-1/qa/marketing/application/service-2/storage/fsx-930",
    "../../../../../../../../us-east-1/qa/finance/data/service-2/monitoring/grafana-668",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/compute/spot-fleet-86",
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/storage/dynamodb-382",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-827?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-827"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}