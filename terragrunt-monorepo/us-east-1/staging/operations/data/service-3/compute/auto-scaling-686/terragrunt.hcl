include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/data/service-2/monitoring/cloudwatch-128",
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/application/service-mesh-993",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/monitoring/alertmanager-415",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-686?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-686"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}