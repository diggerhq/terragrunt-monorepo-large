include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/data/service-3/compute/auto-scaling-598",
    "../../../../../../../../us-east-1/dev/finance/data/service-3/application/service-mesh-832",
    "../../../../../../../../us-west-2/staging/finance/application/service-3/monitoring/alertmanager-174",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-605?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-605"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}