include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/data/service-1/monitoring/log-aggregation-785",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-3/storage/backup-551",
    "../../../../../../../../us-east-1/dev/operations/data/service-1/monitoring/alertmanager-863",
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/security/certificates-843",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-822?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-822"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}