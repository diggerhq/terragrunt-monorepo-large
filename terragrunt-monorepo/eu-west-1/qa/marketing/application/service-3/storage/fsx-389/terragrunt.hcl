include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/data/service-2/security/certificates-229",
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/network/subnet-79",
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/monitoring/alertmanager-153",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/storage/dynamodb-356",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-389?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-389"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}