include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/compute/spot-fleet-70",
    "../../../../../../../../us-east-1/qa/finance/data/service-3/application/service-mesh-273",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/application/load-balancer-398",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-355?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-355"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}