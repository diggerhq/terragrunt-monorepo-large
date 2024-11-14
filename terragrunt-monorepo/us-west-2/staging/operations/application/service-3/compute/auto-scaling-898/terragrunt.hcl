include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/data/service-1/application/event-bus-153",
    "../../../../../../../../eu-west-1/staging/finance/data/service-1/storage/fsx-736",
    "../../../../../../../../us-west-2/dev/operations/application/service-1/compute/auto-scaling-407",
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/storage/rds-581",
    "../../../../../../../../us-east-1/qa/finance/data/service-1/security/iam-322",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-898?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-898"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}