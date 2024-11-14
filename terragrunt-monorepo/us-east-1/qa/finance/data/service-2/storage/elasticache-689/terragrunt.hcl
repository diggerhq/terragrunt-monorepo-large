include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/data/service-1/monitoring/alertmanager-879",
    "../../../../../../../../us-west-2/qa/operations/platform/service-3/compute/spot-fleet-214",
    "../../../../../../../../us-east-1/dev/operations/platform/service-3/network/vpc-605",
    "../../../../../../../../us-east-1/staging/operations/data/service-2/storage/rds-611",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/application/load-balancer-316",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//elasticache-689?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "elasticache-689"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}