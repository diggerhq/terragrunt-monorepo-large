include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/security/certificates-276",
    "../../../../../../../../us-east-1/dev/finance/data/service-2/network/transit-gateway-232",
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/network/transit-gateway-657",
    "../../../../../../../../us-west-2/dev/operations/platform/service-2/network/nacl-452",
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/storage/redshift-732",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-240?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-240"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}