include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/data/service-1/application/load-balancer-863",
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/network/route-table-730",
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/storage/elasticache-647",
    "../../../../../../../../eu-west-1/qa/operations/application/service-1/application/load-balancer-723",
    "../../../../../../../../us-east-1/staging/operations/platform/service-3/storage/fsx-168",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-253?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-253"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}