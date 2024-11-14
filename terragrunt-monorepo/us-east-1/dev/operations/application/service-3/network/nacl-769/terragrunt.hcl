include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/monitoring/prometheus-34",
    "../../../../../../../../us-west-2/dev/operations/application/service-3/compute/ec2-323",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-3/network/direct-connect-911",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-1/monitoring/alertmanager-150",
    "../../../../../../../../us-east-1/dev/finance/platform/service-2/network/route-table-519",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//nacl-769?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "nacl-769"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}