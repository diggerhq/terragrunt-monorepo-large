include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/data/service-3/compute/ec2-561",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/network/nacl-479",
    "../../../../../../../../us-east-1/dev/finance/application/service-2/monitoring/log-aggregation-884",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/storage/fsx-65",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-945?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-945"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}