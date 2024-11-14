include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/application/service-3/storage/elasticache-229",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-1/monitoring/cloudwatch-232",
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/network/subnet-272",
    "../../../../../../../../us-west-2/qa/finance/data/service-2/storage/fsx-78",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-922?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-922"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}