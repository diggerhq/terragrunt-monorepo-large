include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/security/secrets-387",
    "../../../../../../../../us-west-2/dev/finance/application/service-1/storage/efs-747",
    "../../../../../../../../us-east-1/staging/finance/platform/service-2/network/nacl-120",
    "../../../../../../../../us-west-2/qa/finance/platform/service-2/network/direct-connect-395",
    "../../../../../../../../us-east-1/staging/operations/data/service-3/network/subnet-921",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-926?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-926"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}