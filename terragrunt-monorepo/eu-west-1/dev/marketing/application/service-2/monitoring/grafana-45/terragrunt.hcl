include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/data/service-2/storage/redshift-740",
    "../../../../../../../../us-west-2/qa/operations/platform/service-2/network/subnet-167",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/storage/dynamodb-232",
    "../../../../../../../../us-west-2/staging/operations/application/service-1/security/iam-514",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-45?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-45"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}