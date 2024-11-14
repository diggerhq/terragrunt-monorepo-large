include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/data/service-2/security/guardduty-287",
    "../../../../../../../../us-east-1/qa/finance/platform/service-1/monitoring/trace-collection-244",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/network/route-table-806",
    "../../../../../../../../us-east-1/staging/operations/application/service-1/network/endpoint-976",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-206?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-206"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}