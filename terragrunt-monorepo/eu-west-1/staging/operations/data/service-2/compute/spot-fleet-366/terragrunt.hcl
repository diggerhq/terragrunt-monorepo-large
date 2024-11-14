include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/monitoring/cloudwatch-875",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/network/endpoint-498",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/security/certificates-703",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-3/monitoring/cloudwatch-741",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-366?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-366"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}