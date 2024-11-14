include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/data/service-3/monitoring/alertmanager-933",
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/storage/efs-180",
    "../../../../../../../../us-west-2/staging/finance/application/service-3/storage/rds-306",
    "../../../../../../../../us-east-1/dev/operations/application/service-2/security/shield-559",
    "../../../../../../../../us-east-1/staging/finance/application/service-1/network/endpoint-380",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-90?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-90"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}