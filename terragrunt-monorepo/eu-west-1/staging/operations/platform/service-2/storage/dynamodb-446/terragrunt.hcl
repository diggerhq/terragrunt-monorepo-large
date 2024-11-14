include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/network/vpn-493",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/monitoring/log-aggregation-436",
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/application/service-mesh-509",
    "../../../../../../../../us-west-2/staging/operations/data/service-3/compute/ecs-618",
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/security/shield-480",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-446?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-446"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}