include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/data/service-3/security/kms-975",
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/monitoring/trace-collection-461",
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/monitoring/cloudwatch-926",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/storage/rds-100",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-923?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-923"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}