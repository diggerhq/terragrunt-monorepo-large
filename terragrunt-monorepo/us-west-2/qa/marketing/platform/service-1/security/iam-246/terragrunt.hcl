include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/application/service-1/security/certificates-773",
    "../../../../../../../../us-west-2/staging/operations/platform/service-2/application/service-mesh-758",
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/monitoring/log-aggregation-264",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//iam-246?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "iam-246"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}