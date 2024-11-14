include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/storage/backup-715",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-2/monitoring/log-aggregation-190",
    "../../../../../../../../us-east-1/dev/operations/platform/service-3/application/load-balancer-610",
    "../../../../../../../../eu-west-1/dev/operations/data/service-1/storage/redshift-852",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-728?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-728"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}