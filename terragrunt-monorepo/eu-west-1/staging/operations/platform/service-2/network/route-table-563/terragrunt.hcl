include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/network/subnet-379",
    "../../../../../../../../us-east-1/dev/operations/platform/service-1/monitoring/grafana-131",
    "../../../../../../../../us-west-2/qa/operations/data/service-2/network/endpoint-851",
    "../../../../../../../../us-west-2/staging/finance/application/service-3/monitoring/alertmanager-176",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-563?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-563"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}