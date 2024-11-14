include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/application/service-2/security/certificates-263",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/compute/fargate-715",
    "../../../../../../../../us-west-2/staging/finance/data/service-2/compute/lambda-613",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/security/guardduty-507",
    "../../../../../../../../us-west-2/dev/operations/platform/service-2/network/direct-connect-584",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-76?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-76"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}