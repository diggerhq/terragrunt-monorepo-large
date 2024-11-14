include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/application/service-1/compute/auto-scaling-902",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/monitoring/log-aggregation-511",
    "../../../../../../../../us-east-1/staging/finance/data/service-1/monitoring/alertmanager-405",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-328?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-328"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}