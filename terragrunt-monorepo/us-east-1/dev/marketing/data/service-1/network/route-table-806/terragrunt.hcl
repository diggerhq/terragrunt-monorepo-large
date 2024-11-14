include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/platform/service-2/security/guardduty-928",
    "../../../../../../../../us-east-1/qa/operations/data/service-2/monitoring/log-aggregation-813",
    "../../../../../../../../us-west-2/staging/operations/application/service-2/application/queue-216",
    "../../../../../../../../us-east-1/dev/finance/application/service-1/application/service-mesh-879",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-806?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-806"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}