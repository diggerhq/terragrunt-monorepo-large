include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/application/service-1/compute/fargate-994",
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/storage/s3-396",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-1/monitoring/trace-collection-182",
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/compute/spot-fleet-773",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-390?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-390"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}