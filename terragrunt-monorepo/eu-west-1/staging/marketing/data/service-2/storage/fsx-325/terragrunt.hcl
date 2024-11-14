include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/application/service-3/security/kms-500",
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/network/subnet-79",
    "../../../../../../../../us-west-2/qa/finance/data/service-1/monitoring/log-aggregation-836",
    "../../../../../../../../us-west-2/dev/marketing/application/service-1/compute/spot-fleet-810",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-3/storage/efs-531",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-325?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-325"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}