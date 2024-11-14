include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/compute/fargate-379",
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/storage/redshift-31",
    "../../../../../../../../us-east-1/dev/finance/data/service-2/compute/spot-fleet-43",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-473?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-473"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}