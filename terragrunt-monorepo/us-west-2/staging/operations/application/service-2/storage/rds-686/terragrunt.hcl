include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/data/service-1/compute/batch-202",
    "../../../../../../../../us-east-1/staging/operations/application/service-1/monitoring/log-aggregation-160",
    "../../../../../../../../us-west-2/dev/finance/data/service-1/storage/elasticache-359",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/application/load-balancer-598",
    "../../../../../../../../us-west-2/qa/operations/data/service-3/security/waf-520",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-686?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-686"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}