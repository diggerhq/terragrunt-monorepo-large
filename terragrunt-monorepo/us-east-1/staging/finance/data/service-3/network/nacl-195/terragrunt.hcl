include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/platform/service-1/security/secrets-177",
    "../../../../../../../../eu-west-1/dev/finance/application/service-3/storage/efs-378",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-2/network/vpn-417",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/security/certificates-46",
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/storage/backup-815",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//nacl-195?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "nacl-195"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}