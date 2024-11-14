include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/data/service-3/storage/rds-809",
    "../../../../../../../../us-east-1/staging/finance/data/service-3/monitoring/trace-collection-412",
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/security/shield-183",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-2/storage/elasticache-406",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-492?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-492"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}