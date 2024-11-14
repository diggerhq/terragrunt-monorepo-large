include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/monitoring/grafana-500",
    "../../../../../../../../us-east-1/dev/operations/application/service-2/network/vpc-582",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-1/security/security-hub-512",
    "../../../../../../../../us-west-2/staging/finance/data/service-2/application/event-bus-746",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-1/monitoring/trace-collection-95",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-944?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-944"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}