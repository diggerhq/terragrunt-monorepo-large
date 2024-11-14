include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/application/service-3/monitoring/cloudwatch-712",
    "../../../../../../../../us-west-2/dev/operations/platform/service-3/application/service-mesh-181",
    "../../../../../../../../us-east-1/staging/operations/data/service-2/application/event-bus-511",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-855?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-855"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}