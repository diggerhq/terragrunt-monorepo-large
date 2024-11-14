include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/storage/fsx-639",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/storage/elasticache-800",
    "../../../../../../../../us-east-1/staging/marketing/data/service-1/compute/spot-fleet-425",
    "../../../../../../../../us-east-1/qa/finance/data/service-3/security/security-hub-323",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-221?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-221"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}