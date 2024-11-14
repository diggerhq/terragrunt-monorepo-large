include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/storage/fsx-901",
    "../../../../../../../../us-east-1/dev/marketing/application/service-3/compute/auto-scaling-323",
    "../../../../../../../../us-west-2/dev/finance/data/service-1/monitoring/grafana-729",
    "../../../../../../../../us-west-2/qa/operations/data/service-3/network/route-table-209",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/storage/fsx-18",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-540?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-540"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}