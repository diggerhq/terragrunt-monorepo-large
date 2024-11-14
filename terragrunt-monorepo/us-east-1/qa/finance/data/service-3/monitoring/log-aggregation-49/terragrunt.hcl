include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/compute/spot-fleet-366",
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/application/load-balancer-9",
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/monitoring/log-aggregation-264",
    "../../../../../../../../us-west-2/dev/operations/data/service-2/monitoring/trace-collection-140",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-49?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-49"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}