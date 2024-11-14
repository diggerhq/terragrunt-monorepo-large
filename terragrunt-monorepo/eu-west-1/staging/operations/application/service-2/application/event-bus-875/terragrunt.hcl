include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/platform/service-1/compute/auto-scaling-420",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-2/security/certificates-565",
    "../../../../../../../../us-west-2/qa/finance/application/service-3/monitoring/grafana-907",
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/monitoring/prometheus-919",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-875?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-875"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}