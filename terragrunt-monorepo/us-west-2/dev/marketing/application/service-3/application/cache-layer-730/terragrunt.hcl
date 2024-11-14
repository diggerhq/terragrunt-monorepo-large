include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/monitoring/log-aggregation-189",
    "../../../../../../../../us-west-2/dev/finance/application/service-1/storage/rds-645",
    "../../../../../../../../us-west-2/dev/operations/application/service-1/storage/redshift-3",
    "../../../../../../../../us-east-1/staging/finance/data/service-1/application/service-mesh-524",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-730?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-730"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}