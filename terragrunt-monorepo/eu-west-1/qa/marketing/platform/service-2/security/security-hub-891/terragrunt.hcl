include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/application/service-2/network/subnet-407",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-1/network/nacl-862",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-1/storage/s3-623",
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/network/vpc-681",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-891?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-891"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}