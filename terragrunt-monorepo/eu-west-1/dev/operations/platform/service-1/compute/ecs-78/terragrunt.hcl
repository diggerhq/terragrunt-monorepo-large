include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/application/service-3/monitoring/trace-collection-801",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-3/application/service-mesh-843",
    "../../../../../../../../us-west-2/staging/operations/data/service-3/compute/ecs-618",
    "../../../../../../../../us-east-1/dev/operations/application/service-1/network/route-table-856",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-78?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-78"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}