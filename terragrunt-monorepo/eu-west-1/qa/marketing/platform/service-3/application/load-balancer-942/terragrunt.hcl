include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/application/service-2/compute/ec2-897",
    "../../../../../../../../us-west-2/qa/finance/data/service-2/application/load-balancer-524",
    "../../../../../../../../us-east-1/qa/finance/data/service-2/monitoring/grafana-668",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-2/network/subnet-831",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-942?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-942"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}