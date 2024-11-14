include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/compute/ec2-684",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/storage/efs-860",
    "../../../../../../../../us-west-2/qa/marketing/data/service-1/compute/batch-193",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/application/event-bus-221",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-819?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-819"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}