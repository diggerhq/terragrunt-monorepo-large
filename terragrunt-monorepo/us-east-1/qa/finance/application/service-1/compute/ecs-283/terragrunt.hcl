include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/application/service-3/compute/spot-fleet-400",
    "../../../../../../../../eu-west-1/qa/operations/application/service-1/storage/fsx-349",
    "../../../../../../../../us-west-2/qa/marketing/data/service-3/network/route-table-661",
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/storage/rds-691",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-283?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-283"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}