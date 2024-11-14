include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/application/service-3/network/endpoint-937",
    "../../../../../../../../us-east-1/staging/finance/data/service-1/monitoring/alertmanager-405",
    "../../../../../../../../us-east-1/dev/marketing/application/service-2/application/load-balancer-308",
    "../../../../../../../../us-west-2/staging/operations/data/service-2/monitoring/grafana-644",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-877?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-877"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}