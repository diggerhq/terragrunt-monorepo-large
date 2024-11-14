include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/application/service-1/application/service-mesh-490",
    "../../../../../../../../us-west-2/dev/finance/data/service-2/storage/fsx-644",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-1/monitoring/grafana-716",
    "../../../../../../../../us-west-2/staging/finance/application/service-3/monitoring/cloudwatch-107",
    "../../../../../../../../eu-west-1/dev/operations/application/service-3/compute/ecs-514",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-630?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-630"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}