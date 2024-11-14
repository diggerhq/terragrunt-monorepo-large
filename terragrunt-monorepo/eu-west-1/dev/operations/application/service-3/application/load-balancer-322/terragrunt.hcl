include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/application/service-3/network/direct-connect-335",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/application/api-gateway-966",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/monitoring/prometheus-440",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/compute/ec2-704",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-322?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-322"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}