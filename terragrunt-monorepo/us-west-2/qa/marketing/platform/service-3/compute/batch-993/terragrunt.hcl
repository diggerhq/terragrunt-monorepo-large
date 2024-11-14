include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/application/service-1/storage/efs-747",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/security/security-hub-278",
    "../../../../../../../../us-west-2/qa/finance/application/service-1/monitoring/alertmanager-596",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/application/event-bus-744",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/storage/dynamodb-8",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-993?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-993"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}