include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/application/service-2/security/certificates-818",
    "../../../../../../../../eu-west-1/dev/finance/application/service-2/compute/batch-498",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-3/security/waf-149",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/application/api-gateway-487",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-327?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-327"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}