include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/data/service-1/application/event-bus-189",
    "../../../../../../../../us-east-1/staging/marketing/data/service-1/compute/spot-fleet-425",
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/monitoring/grafana-933",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-432?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-432"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}