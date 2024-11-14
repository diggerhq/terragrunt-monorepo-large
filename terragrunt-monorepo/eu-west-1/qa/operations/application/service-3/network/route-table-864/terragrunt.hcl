include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/compute/spot-fleet-70",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/monitoring/trace-collection-795",
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/compute/eks-52",
    "../../../../../../../../us-west-2/dev/marketing/application/service-2/monitoring/grafana-384",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-864?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-864"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}