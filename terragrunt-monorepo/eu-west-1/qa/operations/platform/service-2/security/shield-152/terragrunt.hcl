include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/platform/service-2/security/certificates-941",
    "../../../../../../../../us-west-2/staging/finance/data/service-3/security/secrets-148",
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/storage/fsx-780",
    "../../../../../../../../us-west-2/staging/operations/application/service-2/security/iam-824",
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/network/transit-gateway-200",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-152?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-152"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}