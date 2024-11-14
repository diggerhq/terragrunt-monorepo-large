include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/platform/service-1/storage/rds-956",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/security/kms-816",
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/network/endpoint-430",
    "../../../../../../../../us-east-1/qa/marketing/data/service-3/network/vpc-97",
    "../../../../../../../../us-east-1/dev/operations/platform/service-2/network/vpc-892",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-4?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-4"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}