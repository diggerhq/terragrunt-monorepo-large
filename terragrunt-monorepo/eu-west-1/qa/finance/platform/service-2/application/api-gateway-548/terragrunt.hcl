include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/application/service-2/application/load-balancer-191",
    "../../../../../../../../us-west-2/qa/operations/application/service-3/monitoring/alertmanager-334",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-1/storage/rds-956",
    "../../../../../../../../us-east-1/qa/operations/application/service-3/compute/spot-fleet-400",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-548?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-548"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}