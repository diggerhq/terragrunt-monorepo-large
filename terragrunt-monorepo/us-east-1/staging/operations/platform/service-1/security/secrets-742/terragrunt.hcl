include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/application/service-2/application/load-balancer-113",
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/application/event-bus-555",
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/network/vpn-367",
    "../../../../../../../../us-east-1/qa/operations/data/service-2/monitoring/prometheus-740",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-2/monitoring/grafana-45",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-742?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-742"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}