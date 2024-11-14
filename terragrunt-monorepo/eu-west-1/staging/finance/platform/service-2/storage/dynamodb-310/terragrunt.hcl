include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/data/service-2/network/subnet-383",
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/application/api-gateway-697",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/network/vpc-599",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/network/nacl-36",
    "../../../../../../../../us-west-2/dev/operations/application/service-1/security/iam-267",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-310?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-310"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}