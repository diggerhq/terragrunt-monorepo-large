include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/storage/fsx-669",
    "../../../../../../../../us-west-2/qa/finance/application/service-3/monitoring/log-aggregation-636",
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/compute/ec2-442",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-3/compute/ec2-442",
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/monitoring/alertmanager-780",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-620?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-620"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}