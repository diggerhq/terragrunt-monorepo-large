include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/security/certificates-703",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/network/transit-gateway-76",
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/monitoring/log-aggregation-540",
    "../../../../../../../../us-west-2/staging/operations/application/service-2/security/shield-340",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-391?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-391"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}