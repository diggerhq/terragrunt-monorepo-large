include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/application/service-3/storage/redshift-698",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/monitoring/prometheus-533",
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/network/vpc-681",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/application/service-mesh-293",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-452?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-452"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}