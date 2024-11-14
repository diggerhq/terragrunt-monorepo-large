include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/compute/spot-fleet-318",
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/monitoring/log-aggregation-75",
    "../../../../../../../../us-east-1/qa/finance/data/service-1/compute/auto-scaling-675",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-2/compute/spot-fleet-8",
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/network/route-table-740",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-297?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-297"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}