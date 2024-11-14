include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/security/iam-958",
    "../../../../../../../../us-east-1/staging/finance/application/service-3/monitoring/log-aggregation-502",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/storage/backup-752",
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/monitoring/trace-collection-461",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-990?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-990"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}