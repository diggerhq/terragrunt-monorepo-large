include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/data/service-2/monitoring/prometheus-937",
    "../../../../../../../../us-west-2/qa/finance/data/service-1/compute/fargate-93",
    "../../../../../../../../us-east-1/dev/operations/application/service-3/monitoring/trace-collection-865",
    "../../../../../../../../us-east-1/dev/finance/application/service-2/application/cache-layer-793",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-69?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-69"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}