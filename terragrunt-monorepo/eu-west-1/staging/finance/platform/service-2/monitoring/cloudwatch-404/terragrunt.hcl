include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-2/compute/spot-fleet-897",
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/storage/fsx-571",
    "../../../../../../../../us-west-2/staging/operations/data/service-1/compute/fargate-398",
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/monitoring/log-aggregation-579",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-404?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-404"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}