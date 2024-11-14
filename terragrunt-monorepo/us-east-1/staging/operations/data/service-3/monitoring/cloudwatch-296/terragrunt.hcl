include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/platform/service-1/monitoring/log-aggregation-173",
    "../../../../../../../../us-west-2/qa/marketing/application/service-1/network/vpn-712",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/application/load-balancer-248",
    "../../../../../../../../us-west-2/qa/operations/data/service-2/network/subnet-289",
    "../../../../../../../../us-west-2/staging/finance/data/service-2/monitoring/trace-collection-730",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-296?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-296"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}