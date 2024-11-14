include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/application/api-gateway-616",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/security/secrets-333",
    "../../../../../../../../us-east-1/staging/operations/data/service-2/network/vpn-972",
    "../../../../../../../../eu-west-1/qa/operations/application/service-1/storage/fsx-3",
    "../../../../../../../../us-east-1/staging/marketing/data/service-3/application/queue-168",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-841?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-841"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}