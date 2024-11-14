include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/application/service-2/storage/elasticache-280",
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/compute/spot-fleet-891",
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/application/load-balancer-926",
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/network/vpc-93",
    "../../../../../../../../us-east-1/staging/operations/data/service-3/network/endpoint-594",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-906?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-906"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}