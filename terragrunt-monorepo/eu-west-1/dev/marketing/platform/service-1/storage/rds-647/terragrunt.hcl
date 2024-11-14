include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/security/shield-158",
    "../../../../../../../../us-west-2/dev/operations/platform/service-1/compute/fargate-497",
    "../../../../../../../../us-east-1/staging/finance/data/service-1/application/api-gateway-236",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/network/nacl-668",
    "../../../../../../../../us-west-2/qa/marketing/application/service-2/network/vpc-949",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-647?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-647"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}