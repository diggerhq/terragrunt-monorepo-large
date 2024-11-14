include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/application/service-mesh-586",
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/network/direct-connect-308",
    "../../../../../../../../us-west-2/staging/operations/data/service-1/monitoring/cloudwatch-341",
    "../../../../../../../../eu-west-1/dev/operations/application/service-3/monitoring/trace-collection-953",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-106?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-106"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}