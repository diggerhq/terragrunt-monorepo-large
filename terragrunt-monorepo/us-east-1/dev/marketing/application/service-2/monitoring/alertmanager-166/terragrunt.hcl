include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/data/service-2/security/certificates-292",
    "../../../../../../../../us-east-1/staging/operations/data/service-2/network/endpoint-727",
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/security/certificates-103",
    "../../../../../../../../us-west-2/dev/operations/data/service-1/application/load-balancer-942",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-166?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-166"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}