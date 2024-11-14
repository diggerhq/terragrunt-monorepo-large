include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/data/service-1/application/load-balancer-29",
    "../../../../../../../../eu-west-1/qa/finance/data/service-3/storage/redshift-524",
    "../../../../../../../../us-west-2/staging/marketing/data/service-3/application/api-gateway-811",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/security/iam-285",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-293?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-293"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}