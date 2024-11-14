include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/data/service-2/monitoring/trace-collection-516",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/storage/redshift-270",
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/application/event-bus-685",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/network/route-table-455",
    "../../../../../../../../us-west-2/staging/operations/data/service-2/monitoring/grafana-644",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-492?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-492"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}