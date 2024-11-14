include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/application/service-2/application/service-mesh-168",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/application/api-gateway-487",
    "../../../../../../../../us-east-1/dev/operations/platform/service-1/security/certificates-798",
    "../../../../../../../../us-west-2/dev/operations/platform/service-2/security/kms-256",
    "../../../../../../../../eu-west-1/qa/finance/data/service-1/network/endpoint-572",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//iam-781?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "iam-781"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}