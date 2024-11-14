include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/data/service-1/storage/redshift-352",
    "../../../../../../../../us-west-2/staging/finance/data/service-1/compute/spot-fleet-744",
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/monitoring/prometheus-315",
    "../../../../../../../../us-east-1/qa/operations/application/service-3/compute/ec2-715",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-649?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-649"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}