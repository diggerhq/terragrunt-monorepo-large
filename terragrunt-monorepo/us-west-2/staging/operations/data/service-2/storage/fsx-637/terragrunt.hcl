include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/compute/eks-226",
    "../../../../../../../../eu-west-1/qa/finance/data/service-3/network/vpc-878",
    "../../../../../../../../eu-west-1/dev/finance/application/service-1/monitoring/prometheus-726",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/monitoring/log-aggregation-395",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-637?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-637"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}