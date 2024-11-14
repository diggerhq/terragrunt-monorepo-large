include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/application/service-2/compute/spot-fleet-398",
    "../../../../../../../../us-west-2/staging/operations/application/service-3/monitoring/cloudwatch-712",
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/monitoring/grafana-500",
    "../../../../../../../../us-east-1/dev/finance/application/service-2/compute/auto-scaling-632",
    "../../../../../../../../us-east-1/dev/operations/data/service-3/network/endpoint-995",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-516?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-516"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}