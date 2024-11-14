include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/application/service-2/application/cache-layer-712",
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/compute/eks-916",
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/storage/rds-877",
    "../../../../../../../../us-east-1/staging/operations/data/service-3/security/shield-826",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-3/compute/batch-389",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-254?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-254"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}