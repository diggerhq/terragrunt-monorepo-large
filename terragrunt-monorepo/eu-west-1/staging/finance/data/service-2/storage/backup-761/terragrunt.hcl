include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/security/secrets-171",
    "../../../../../../../../eu-west-1/staging/operations/application/service-3/network/endpoint-815",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-3/network/vpc-4",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/monitoring/alertmanager-254",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-761?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-761"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}