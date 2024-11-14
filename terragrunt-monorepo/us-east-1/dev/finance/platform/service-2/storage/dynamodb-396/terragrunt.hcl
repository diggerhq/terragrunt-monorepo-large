include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/monitoring/grafana-623",
    "../../../../../../../../us-west-2/qa/operations/platform/service-2/monitoring/prometheus-878",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/application/service-mesh-960",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-396?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-396"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}