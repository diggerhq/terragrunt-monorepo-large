include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/compute/auto-scaling-561",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-1/compute/batch-925",
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/security/shield-52",
    "../../../../../../../../us-west-2/dev/operations/application/service-3/storage/elasticache-696",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-991?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-991"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}