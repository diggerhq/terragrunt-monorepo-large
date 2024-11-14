include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/security/shield-139",
    "../../../../../../../../us-east-1/staging/operations/data/service-1/network/transit-gateway-703",
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/security/iam-522",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-1/storage/efs-355",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-532?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-532"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}