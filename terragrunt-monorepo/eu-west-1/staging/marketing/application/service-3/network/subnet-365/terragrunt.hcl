include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/data/service-1/storage/backup-669",
    "../../../../../../../../us-east-1/staging/finance/application/service-1/monitoring/alertmanager-345",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/monitoring/alertmanager-389",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-365?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-365"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}