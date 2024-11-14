include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/application/service-3/security/iam-989",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/network/route-table-767",
    "../../../../../../../../us-east-1/staging/finance/data/service-2/storage/fsx-839",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-839?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-839"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}