include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/data/service-2/monitoring/cloudwatch-187",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/storage/dynamodb-28",
    "../../../../../../../../us-east-1/dev/operations/data/service-3/storage/dynamodb-352",
    "../../../../../../../../us-west-2/qa/finance/application/service-2/security/guardduty-4",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-181?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-181"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}