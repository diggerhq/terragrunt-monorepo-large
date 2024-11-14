include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/platform/service-3/monitoring/cloudwatch-49",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/storage/dynamodb-123",
    "../../../../../../../../us-east-1/qa/marketing/data/service-2/application/service-mesh-275",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-375?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-375"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}