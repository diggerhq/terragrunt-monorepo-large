include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/application/service-1/storage/rds-848",
    "../../../../../../../../us-west-2/dev/finance/platform/service-1/storage/efs-940",
    "../../../../../../../../eu-west-1/dev/finance/application/service-3/monitoring/trace-collection-512",
    "../../../../../../../../us-west-2/staging/finance/data/service-3/application/api-gateway-526",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-230?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-230"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}