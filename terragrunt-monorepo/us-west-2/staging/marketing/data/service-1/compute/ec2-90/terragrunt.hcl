include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/security/shield-52",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/security/secrets-222",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/network/nacl-938",
    "../../../../../../../../eu-west-1/dev/finance/application/service-2/monitoring/trace-collection-750",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-90?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-90"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}