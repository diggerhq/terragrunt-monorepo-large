include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/data/service-1/security/kms-457",
    "../../../../../../../../us-east-1/staging/finance/application/service-2/network/vpc-242",
    "../../../../../../../../us-west-2/dev/marketing/application/service-2/storage/s3-118",
    "../../../../../../../../us-west-2/qa/operations/application/service-1/security/secrets-395",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-157?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-157"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}