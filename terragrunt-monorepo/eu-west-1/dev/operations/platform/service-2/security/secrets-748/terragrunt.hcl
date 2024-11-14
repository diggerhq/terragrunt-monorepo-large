include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/platform/service-1/application/cache-layer-475",
    "../../../../../../../../eu-west-1/staging/operations/application/service-3/security/certificates-537",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-1/application/service-mesh-602",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/application/api-gateway-383",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-748?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-748"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}