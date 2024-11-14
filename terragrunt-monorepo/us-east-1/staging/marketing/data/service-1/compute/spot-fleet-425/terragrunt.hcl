include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/data/service-3/application/api-gateway-811",
    "../../../../../../../../us-west-2/qa/finance/application/service-1/monitoring/alertmanager-596",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-425?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-425"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}