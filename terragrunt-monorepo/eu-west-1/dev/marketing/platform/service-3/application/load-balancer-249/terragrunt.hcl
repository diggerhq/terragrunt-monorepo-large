include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/security/iam-522",
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/compute/lambda-157",
    "../../../../../../../../us-east-1/dev/finance/application/service-2/network/vpn-697",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-3/storage/fsx-389",
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/storage/s3-833",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-249?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-249"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}