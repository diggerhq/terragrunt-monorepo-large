include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/data/service-2/storage/elasticache-689",
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/network/vpn-156",
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/compute/spot-fleet-734",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/security/certificates-876",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-202?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-202"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}