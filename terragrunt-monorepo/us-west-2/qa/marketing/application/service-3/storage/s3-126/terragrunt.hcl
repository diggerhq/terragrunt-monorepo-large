include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/platform/service-3/network/vpc-467",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-1/storage/rds-99",
    "../../../../../../../../us-west-2/staging/finance/platform/service-3/monitoring/grafana-358",
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/storage/rds-153",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//s3-126?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "s3-126"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}