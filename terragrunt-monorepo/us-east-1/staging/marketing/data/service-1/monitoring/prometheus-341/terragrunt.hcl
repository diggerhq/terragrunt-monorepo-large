include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/data/service-3/application/service-mesh-804",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/application/cache-layer-627",
    "../../../../../../../../us-west-2/dev/finance/data/service-1/monitoring/trace-collection-348",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-341?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-341"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}