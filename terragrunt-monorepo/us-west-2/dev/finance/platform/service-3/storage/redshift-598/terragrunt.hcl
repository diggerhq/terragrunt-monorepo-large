include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/application/service-3/storage/s3-21",
    "../../../../../../../../us-west-2/dev/finance/data/service-1/network/transit-gateway-372",
    "../../../../../../../../us-west-2/qa/finance/platform/service-1/monitoring/log-aggregation-922",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-598?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-598"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}