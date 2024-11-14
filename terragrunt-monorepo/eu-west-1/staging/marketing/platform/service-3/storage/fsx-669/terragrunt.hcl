include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/application/cache-layer-581",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/monitoring/cloudwatch-118",
    "../../../../../../../../us-east-1/staging/operations/data/service-3/compute/ec2-302",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/monitoring/prometheus-465",
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/compute/auto-scaling-552",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-669?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-669"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}