include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/application/load-balancer-940",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-2/monitoring/trace-collection-413",
    "../../../../../../../../us-east-1/staging/finance/data/service-3/application/api-gateway-207",
    "../../../../../../../../us-west-2/dev/operations/data/service-2/compute/auto-scaling-75",
    "../../../../../../../../us-west-2/staging/finance/platform/service-2/compute/auto-scaling-228",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-912?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-912"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}