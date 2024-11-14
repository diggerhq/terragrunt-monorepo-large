include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/application/service-1/monitoring/alertmanager-679",
    "../../../../../../../../eu-west-1/qa/finance/data/service-1/storage/redshift-738",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/security/guardduty-551",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-583?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-583"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}