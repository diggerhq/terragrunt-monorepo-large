include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/application/service-1/application/load-balancer-544",
    "../../../../../../../../us-west-2/staging/operations/platform/service-3/security/security-hub-664",
    "../../../../../../../../us-east-1/staging/finance/application/service-1/storage/elasticache-914",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-3/network/nacl-885",
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/storage/rds-534",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-381?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-381"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}