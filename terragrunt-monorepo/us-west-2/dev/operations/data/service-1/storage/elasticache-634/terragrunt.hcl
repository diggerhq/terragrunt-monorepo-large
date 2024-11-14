include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/compute/spot-fleet-558",
    "../../../../../../../../us-west-2/dev/marketing/application/service-1/compute/ecs-617",
    "../../../../../../../../us-west-2/staging/operations/platform/service-3/storage/redshift-318",
    "../../../../../../../../us-west-2/dev/operations/application/service-3/network/route-table-756",
    "../../../../../../../../us-east-1/dev/operations/application/service-2/network/endpoint-736",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//elasticache-634?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "elasticache-634"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}