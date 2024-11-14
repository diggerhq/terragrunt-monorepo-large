include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/security/shield-764",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/monitoring/cloudwatch-916",
    "../../../../../../../../us-east-1/dev/operations/application/service-3/security/certificates-585",
    "../../../../../../../../us-east-1/qa/finance/application/service-3/security/shield-91",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-961?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-961"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}