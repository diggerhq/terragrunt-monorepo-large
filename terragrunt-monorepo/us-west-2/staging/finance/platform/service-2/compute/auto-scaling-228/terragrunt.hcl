include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/application/queue-819",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/monitoring/prometheus-896",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/security/security-hub-728",
    "../../../../../../../../us-east-1/staging/operations/data/service-3/security/shield-826",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-228?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-228"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}