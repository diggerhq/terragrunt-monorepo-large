include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/storage/dynamodb-48",
    "../../../../../../../../us-west-2/staging/operations/application/service-3/storage/efs-588",
    "../../../../../../../../us-west-2/qa/finance/application/service-3/network/nacl-466",
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/monitoring/trace-collection-273",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//s3-911?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "s3-911"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}