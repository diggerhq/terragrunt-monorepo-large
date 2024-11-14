include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/monitoring/grafana-674",
    "../../../../../../../../us-east-1/dev/operations/data/service-3/network/vpc-103",
    "../../../../../../../../us-west-2/qa/operations/platform/service-2/compute/batch-177",
    "../../../../../../../../us-west-2/qa/finance/application/service-1/monitoring/alertmanager-596",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-336?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-336"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}