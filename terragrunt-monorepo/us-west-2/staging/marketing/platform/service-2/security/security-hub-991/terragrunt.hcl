include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/application/service-1/application/load-balancer-723",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-3/compute/batch-197",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/network/route-table-225",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-3/monitoring/grafana-88",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/application/load-balancer-248",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-991?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-991"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}