include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/network/vpn-565",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/compute/fargate-832",
    "../../../../../../../../us-east-1/qa/operations/platform/service-3/network/subnet-601",
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/network/endpoint-719",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-679?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-679"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}