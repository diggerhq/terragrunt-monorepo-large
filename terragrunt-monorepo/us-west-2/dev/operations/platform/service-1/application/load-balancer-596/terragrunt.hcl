include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/application/api-gateway-897",
    "../../../../../../../../us-east-1/dev/finance/data/service-3/compute/spot-fleet-794",
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/storage/fsx-407",
    "../../../../../../../../eu-west-1/staging/finance/data/service-1/monitoring/trace-collection-327",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-596?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-596"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}