include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/compute/spot-fleet-318",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-3/application/load-balancer-942",
    "../../../../../../../../us-east-1/qa/marketing/application/service-2/network/vpc-410",
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/network/direct-connect-672",
    "../../../../../../../../us-east-1/staging/operations/platform/service-3/monitoring/grafana-683",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-816?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-816"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}