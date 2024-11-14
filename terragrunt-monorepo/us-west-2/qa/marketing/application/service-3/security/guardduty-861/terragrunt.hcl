include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/security/kms-482",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/security/security-hub-905",
    "../../../../../../../../us-west-2/qa/finance/data/service-3/storage/dynamodb-442",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-1/monitoring/trace-collection-289",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-861?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-861"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}