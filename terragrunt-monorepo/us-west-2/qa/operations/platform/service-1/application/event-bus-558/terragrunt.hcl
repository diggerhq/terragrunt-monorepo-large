include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/data/service-1/security/kms-21",
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/monitoring/alertmanager-748",
    "../../../../../../../../us-west-2/dev/marketing/data/service-2/storage/fsx-131",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/security/security-hub-343",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-558?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-558"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}