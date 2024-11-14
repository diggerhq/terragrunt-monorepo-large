include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/data/service-1/application/load-balancer-29",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-1/network/direct-connect-812",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-2/application/cache-layer-355",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/monitoring/trace-collection-685",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-85?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-85"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}