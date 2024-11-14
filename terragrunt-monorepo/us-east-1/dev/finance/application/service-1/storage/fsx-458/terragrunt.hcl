include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/network/nacl-260",
    "../../../../../../../../us-west-2/qa/finance/data/service-2/network/subnet-395",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/network/transit-gateway-349",
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/compute/ec2-715",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/monitoring/cloudwatch-359",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-458?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-458"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}