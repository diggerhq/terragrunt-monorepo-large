include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/data/service-3/network/vpc-525",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-3/storage/efs-431",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-2/monitoring/grafana-155",
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/storage/dynamodb-48",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-403?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-403"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}