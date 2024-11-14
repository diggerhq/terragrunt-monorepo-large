include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/application/service-1/storage/redshift-646",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/security/certificates-631",
    "../../../../../../../../eu-west-1/qa/finance/data/service-3/network/vpc-878",
    "../../../../../../../../us-east-1/qa/operations/application/service-3/network/transit-gateway-332",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-459?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-459"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}