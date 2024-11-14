include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/data/service-2/storage/s3-622",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/application/service-mesh-98",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/compute/auto-scaling-480",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-604?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-604"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}