include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/security/certificates-843",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/monitoring/alertmanager-502",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/network/subnet-407",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//kms-817?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "kms-817"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}