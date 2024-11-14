include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/application/service-3/application/queue-254",
    "../../../../../../../../us-east-1/staging/finance/data/service-3/compute/auto-scaling-361",
    "../../../../../../../../us-east-1/staging/finance/platform/service-3/compute/batch-933",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/application/service-mesh-505",
    "../../../../../../../../us-east-1/qa/finance/data/service-3/storage/efs-835",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-975?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-975"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}