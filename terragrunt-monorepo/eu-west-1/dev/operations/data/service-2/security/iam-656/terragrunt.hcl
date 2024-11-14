include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/security/guardduty-543",
    "../../../../../../../../us-east-1/staging/finance/data/service-3/storage/dynamodb-999",
    "../../../../../../../../us-east-1/staging/finance/application/service-1/monitoring/log-aggregation-440",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//iam-656?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "iam-656"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}