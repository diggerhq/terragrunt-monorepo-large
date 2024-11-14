include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/storage/redshift-439",
    "../../../../../../../../us-west-2/staging/operations/application/service-3/security/guardduty-37",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/application/service-mesh-980",
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/security/waf-451",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//lambda-290?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "lambda-290"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}