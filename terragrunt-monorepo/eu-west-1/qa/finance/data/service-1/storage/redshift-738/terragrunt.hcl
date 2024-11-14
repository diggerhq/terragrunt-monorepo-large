include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/data/service-1/storage/fsx-509",
    "../../../../../../../../eu-west-1/qa/finance/data/service-1/network/direct-connect-354",
    "../../../../../../../../us-west-2/staging/finance/data/service-1/storage/backup-325",
    "../../../../../../../../us-west-2/qa/operations/platform/service-3/monitoring/grafana-662",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-738?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-738"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}