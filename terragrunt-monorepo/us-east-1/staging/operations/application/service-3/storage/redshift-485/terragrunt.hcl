include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/monitoring/log-aggregation-189",
    "../../../../../../../../us-east-1/dev/finance/application/service-3/storage/backup-740",
    "../../../../../../../../us-west-2/dev/operations/platform/service-3/security/kms-26",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-2/storage/elasticache-859",
    "../../../../../../../../us-east-1/staging/operations/data/service-3/application/queue-392",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-485?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-485"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}