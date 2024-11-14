include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/data/service-3/storage/dynamodb-596",
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/network/transit-gateway-648",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/security/certificates-675",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-291?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-291"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}