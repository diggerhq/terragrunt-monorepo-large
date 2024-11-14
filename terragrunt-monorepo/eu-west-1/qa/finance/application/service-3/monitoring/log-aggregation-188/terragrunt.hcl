include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/data/service-1/network/endpoint-577",
    "../../../../../../../../us-west-2/qa/finance/application/service-1/compute/lambda-941",
    "../../../../../../../../us-west-2/staging/operations/platform/service-2/monitoring/prometheus-226",
    "../../../../../../../../us-east-1/staging/finance/application/service-2/network/vpc-29",
    "../../../../../../../../us-east-1/dev/operations/platform/service-2/network/vpn-676",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-188?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-188"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}