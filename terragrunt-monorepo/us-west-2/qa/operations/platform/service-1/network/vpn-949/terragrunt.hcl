include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/platform/service-3/security/certificates-858",
    "../../../../../../../../us-west-2/dev/operations/application/service-3/monitoring/alertmanager-655",
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/network/direct-connect-663",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-1/compute/fargate-144",
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/network/subnet-225",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-949?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-949"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}