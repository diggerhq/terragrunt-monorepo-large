include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/platform/service-3/monitoring/trace-collection-502",
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/network/nacl-600",
    "../../../../../../../../us-west-2/dev/marketing/data/service-2/security/guardduty-529",
    "../../../../../../../../us-west-2/dev/marketing/application/service-1/monitoring/cloudwatch-828",
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/security/secrets-749",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//kms-235?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "kms-235"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}