include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/application/queue-396",
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/network/transit-gateway-497",
    "../../../../../../../../us-east-1/dev/operations/application/service-2/monitoring/log-aggregation-475",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-377?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-377"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}