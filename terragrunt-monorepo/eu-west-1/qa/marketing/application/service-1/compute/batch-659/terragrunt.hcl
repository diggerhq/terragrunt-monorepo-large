include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-2/storage/s3-303",
    "../../../../../../../../us-east-1/staging/finance/data/service-2/application/event-bus-222",
    "../../../../../../../../us-east-1/staging/finance/platform/service-3/compute/batch-933",
    "../../../../../../../../us-west-2/qa/marketing/data/service-1/application/load-balancer-589",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-659?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-659"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}