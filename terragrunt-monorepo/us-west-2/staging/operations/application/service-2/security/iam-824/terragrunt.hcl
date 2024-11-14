include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/data/service-2/application/queue-879",
    "../../../../../../../../us-east-1/dev/finance/data/service-3/storage/fsx-89",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/application/load-balancer-668",
    "../../../../../../../../us-east-1/dev/finance/platform/service-2/monitoring/grafana-483",
    "../../../../../../../../us-west-2/staging/finance/application/service-3/monitoring/alertmanager-174",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//iam-824?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "iam-824"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}