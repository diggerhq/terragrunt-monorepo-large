include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/data/service-1/network/endpoint-206",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/security/shield-292",
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/security/certificates-406",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/application/api-gateway-289",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-1/security/security-hub-637",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-684?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-684"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}