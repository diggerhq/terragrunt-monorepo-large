include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/monitoring/log-aggregation-77",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-872?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-872"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}