include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/monitoring/log-aggregation-798",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/network/route-table-940",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-2/network/nacl-247",
    "../../../../../../../../us-east-1/qa/operations/data/service-2/storage/s3-715",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-57?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-57"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}