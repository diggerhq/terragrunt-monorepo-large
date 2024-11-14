include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/platform/service-2/security/guardduty-992",
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/monitoring/alertmanager-535",
    "../../../../../../../../us-west-2/dev/finance/data/service-2/security/iam-520",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/storage/dynamodb-28",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//kms-505?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "kms-505"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}