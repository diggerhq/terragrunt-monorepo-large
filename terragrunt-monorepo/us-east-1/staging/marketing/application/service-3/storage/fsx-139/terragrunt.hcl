include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/data/service-1/storage/rds-459",
    "../../../../../../../../eu-west-1/qa/finance/application/service-1/network/nacl-26",
    "../../../../../../../../us-west-2/qa/marketing/data/service-2/storage/elasticache-440",
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/storage/fsx-571",
    "../../../../../../../../us-west-2/staging/operations/platform/service-3/monitoring/prometheus-31",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-139?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-139"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}