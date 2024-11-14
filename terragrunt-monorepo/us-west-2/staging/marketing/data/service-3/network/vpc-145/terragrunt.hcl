include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/data/service-3/compute/auto-scaling-686",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/application/cache-layer-78",
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/application/service-mesh-22",
    "../../../../../../../../us-west-2/qa/operations/application/service-3/network/endpoint-937",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-145?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-145"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}