include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/security/shield-94",
    "../../../../../../../../eu-west-1/staging/finance/data/service-1/network/endpoint-207",
    "../../../../../../../../us-east-1/dev/finance/platform/service-3/compute/ec2-938",
    "../../../../../../../../us-east-1/dev/finance/data/service-3/monitoring/prometheus-639",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-446?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-446"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}