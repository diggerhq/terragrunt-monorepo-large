include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/platform/service-3/monitoring/alertmanager-181",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/security/kms-314",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/application/queue-796",
    "../../../../../../../../us-west-2/dev/operations/application/service-1/security/secrets-699",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-632?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-632"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}