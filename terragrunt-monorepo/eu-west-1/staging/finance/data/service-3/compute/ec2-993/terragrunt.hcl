include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/application/service-1/compute/ecs-208",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/application/load-balancer-520",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/monitoring/prometheus-547",
    "../../../../../../../../us-east-1/qa/operations/data/service-2/network/subnet-825",
    "../../../../../../../../us-west-2/staging/finance/application/service-1/application/api-gateway-176",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-993?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-993"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}