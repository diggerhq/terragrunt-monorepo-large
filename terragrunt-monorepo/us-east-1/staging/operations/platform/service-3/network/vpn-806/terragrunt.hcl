include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/application/service-2/compute/ecs-350",
    "../../../../../../../../us-east-1/staging/marketing/data/service-1/compute/spot-fleet-128",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/monitoring/prometheus-465",
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/compute/ec2-993",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-806?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-806"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}