include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/application/queue-339",
    "../../../../../../../../us-east-1/qa/operations/platform/service-2/application/cache-layer-832",
    "../../../../../../../../us-west-2/dev/operations/data/service-3/application/service-mesh-804",
    "../../../../../../../../us-west-2/staging/operations/data/service-2/application/cache-layer-778",
    "../../../../../../../../us-east-1/qa/operations/platform/service-2/application/event-bus-481",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-893?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-893"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}