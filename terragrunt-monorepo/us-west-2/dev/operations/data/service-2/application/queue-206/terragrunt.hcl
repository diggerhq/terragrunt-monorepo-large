include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/platform/service-1/storage/s3-623",
    "../../../../../../../../us-west-2/dev/finance/data/service-3/storage/fsx-289",
    "../../../../../../../../eu-west-1/staging/operations/data/service-3/application/queue-327",
    "../../../../../../../../us-east-1/dev/operations/data/service-3/monitoring/log-aggregation-40",
    "../../../../../../../../us-west-2/qa/finance/application/service-2/compute/auto-scaling-991",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-206?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-206"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}