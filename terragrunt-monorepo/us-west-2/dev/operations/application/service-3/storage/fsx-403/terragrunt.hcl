include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/network/vpn-164",
    "../../../../../../../../us-east-1/staging/operations/data/service-3/compute/ec2-302",
    "../../../../../../../../us-west-2/dev/finance/platform/service-1/monitoring/prometheus-574",
    "../../../../../../../../us-east-1/qa/operations/application/service-3/network/vpn-905",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-403?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-403"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}