include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/compute/lambda-679",
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/monitoring/prometheus-102",
    "../../../../../../../../us-east-1/staging/marketing/data/service-1/compute/spot-fleet-128",
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/network/vpn-432",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-95?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-95"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}