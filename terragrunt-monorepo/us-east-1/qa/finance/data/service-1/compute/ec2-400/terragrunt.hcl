include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/security/kms-502",
    "../../../../../../../../us-east-1/staging/operations/data/service-2/security/secrets-512",
    "../../../../../../../../us-west-2/dev/operations/platform/service-1/application/cache-layer-457",
    "../../../../../../../../us-west-2/dev/finance/application/service-1/application/queue-227",
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/network/nacl-896",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-400?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-400"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}