include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/platform/service-2/application/cache-layer-678",
    "../../../../../../../../us-east-1/dev/finance/application/service-2/security/certificates-271",
    "../../../../../../../../us-west-2/staging/operations/data/service-3/security/security-hub-256",
    "../../../../../../../../eu-west-1/dev/finance/application/service-2/monitoring/alertmanager-83",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/network/vpc-351",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-367?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-367"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}