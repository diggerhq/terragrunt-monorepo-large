include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/platform/service-1/security/iam-797",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/security/shield-656",
    "../../../../../../../../us-east-1/staging/finance/application/service-3/network/subnet-775",
    "../../../../../../../../us-west-2/qa/operations/application/service-1/monitoring/cloudwatch-667",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-61?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-61"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}