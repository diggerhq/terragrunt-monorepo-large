include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/compute/fargate-582",
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/storage/redshift-31",
    "../../../../../../../../us-east-1/dev/operations/data/service-1/compute/spot-fleet-136",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/storage/efs-960",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-58?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-58"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}