include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/application/service-2/monitoring/log-aggregation-990",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-2/network/direct-connect-843",
    "../../../../../../../../us-west-2/staging/finance/platform/service-2/security/iam-714",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//s3-971?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "s3-971"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}