include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/application/service-3/monitoring/trace-collection-282",
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/storage/elasticache-723",
    "../../../../../../../../us-west-2/qa/operations/platform/service-1/compute/lambda-672",
    "../../../../../../../../us-west-2/qa/finance/application/service-2/security/shield-80",
    "../../../../../../../../us-east-1/qa/operations/data/service-2/monitoring/log-aggregation-295",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-860?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-860"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}