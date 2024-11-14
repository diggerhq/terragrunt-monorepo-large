include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/data/service-2/compute/ecs-362",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/monitoring/grafana-517",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-2/network/subnet-831",
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/compute/ecs-372",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-125?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-125"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}