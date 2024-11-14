include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/monitoring/trace-collection-334",
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/network/vpn-432",
    "../../../../../../../../us-east-1/dev/operations/platform/service-3/application/load-balancer-610",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-401?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-401"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}