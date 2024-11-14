include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/platform/service-2/storage/backup-986",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-1/network/route-table-958",
    "../../../../../../../../us-east-1/qa/finance/data/service-2/network/direct-connect-898",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/network/endpoint-712",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-661?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-661"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}