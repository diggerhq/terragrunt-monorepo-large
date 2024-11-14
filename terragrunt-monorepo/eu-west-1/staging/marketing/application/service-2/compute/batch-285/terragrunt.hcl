include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/data/service-3/storage/s3-311",
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/compute/lambda-988",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-3/security/kms-295",
    "../../../../../../../../us-west-2/qa/operations/data/service-3/network/subnet-767",
    "../../../../../../../../us-west-2/qa/finance/data/service-1/storage/elasticache-638",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-285?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-285"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}