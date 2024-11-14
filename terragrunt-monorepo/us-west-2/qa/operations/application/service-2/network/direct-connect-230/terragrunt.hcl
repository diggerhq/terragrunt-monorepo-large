include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/application/service-1/compute/auto-scaling-567",
    "../../../../../../../../us-west-2/qa/operations/data/service-3/monitoring/alertmanager-71",
    "../../../../../../../../us-east-1/qa/operations/application/service-2/monitoring/grafana-739",
    "../../../../../../../../us-east-1/qa/finance/data/service-3/storage/efs-733",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-230?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-230"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}