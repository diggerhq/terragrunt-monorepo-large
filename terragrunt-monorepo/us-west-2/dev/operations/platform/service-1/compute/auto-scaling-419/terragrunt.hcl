include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/compute/batch-603",
    "../../../../../../../../us-east-1/staging/finance/data/service-1/security/secrets-204",
    "../../../../../../../../us-east-1/qa/marketing/data/service-3/network/direct-connect-655",
    "../../../../../../../../us-east-1/qa/marketing/application/service-3/security/certificates-508",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-419?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-419"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}