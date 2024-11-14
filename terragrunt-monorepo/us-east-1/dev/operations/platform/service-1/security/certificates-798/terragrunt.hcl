include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/platform/service-3/application/queue-956",
    "../../../../../../../../eu-west-1/qa/finance/data/service-1/security/shield-49",
    "../../../../../../../../us-west-2/qa/marketing/data/service-2/network/subnet-383",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/security/security-hub-429",
    "../../../../../../../../us-east-1/staging/operations/data/service-1/network/subnet-521",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-798?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-798"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}