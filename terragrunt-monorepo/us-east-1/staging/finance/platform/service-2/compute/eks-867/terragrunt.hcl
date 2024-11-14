include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/data/service-3/storage/fsx-89",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-1/network/subnet-801",
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/monitoring/grafana-674",
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/storage/rds-643",
    "../../../../../../../../us-west-2/dev/marketing/application/service-3/application/load-balancer-335",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-867?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-867"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}