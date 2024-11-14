include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/application/service-3/compute/spot-fleet-767",
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/compute/auto-scaling-552",
    "../../../../../../../../us-east-1/dev/finance/platform/service-3/storage/redshift-521",
    "../../../../../../../../us-west-2/qa/marketing/data/service-3/network/vpc-732",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-334?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-334"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}