include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/data/service-2/network/endpoint-687",
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/network/vpn-140",
    "../../../../../../../../us-east-1/staging/finance/application/service-2/network/vpc-242",
    "../../../../../../../../us-east-1/staging/finance/data/service-3/storage/dynamodb-999",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-480?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-480"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}