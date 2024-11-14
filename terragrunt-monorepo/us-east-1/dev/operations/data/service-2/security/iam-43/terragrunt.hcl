include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/application/service-2/application/api-gateway-107",
    "../../../../../../../../us-east-1/dev/finance/data/service-3/storage/rds-573",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/security/guardduty-90",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/storage/rds-459",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//iam-43?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "iam-43"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}