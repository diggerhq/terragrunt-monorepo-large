include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/storage/elasticache-352",
    "../../../../../../../../us-west-2/qa/operations/data/service-3/security/waf-520",
    "../../../../../../../../us-east-1/qa/finance/application/service-3/application/cache-layer-6",
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/application/cache-layer-268",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//kms-334?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "kms-334"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}