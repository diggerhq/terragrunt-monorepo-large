include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/application/service-3/security/certificates-537",
    "../../../../../../../../us-east-1/qa/finance/application/service-3/security/shield-13",
    "../../../../../../../../us-west-2/dev/operations/platform/service-1/network/nacl-361",
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/network/route-table-77",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-146?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-146"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}