include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/application/service-2/application/event-bus-859",
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/application/event-bus-555",
    "../../../../../../../../us-east-1/qa/finance/data/service-2/monitoring/trace-collection-516",
    "../../../../../../../../us-west-2/staging/finance/application/service-1/compute/auto-scaling-805",
    "../../../../../../../../eu-west-1/staging/finance/data/service-1/security/waf-829",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-830?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-830"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}