include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-2/storage/rds-383",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-1/monitoring/alertmanager-501",
    "../../../../../../../../us-east-1/staging/finance/application/service-2/monitoring/alertmanager-535",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-1/monitoring/trace-collection-473",
    "../../../../../../../../us-west-2/qa/finance/platform/service-2/application/service-mesh-216",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-496?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-496"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}