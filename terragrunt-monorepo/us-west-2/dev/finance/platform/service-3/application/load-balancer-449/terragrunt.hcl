include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/application/service-1/application/queue-320",
    "../../../../../../../../us-west-2/dev/operations/data/service-3/storage/elasticache-120",
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/compute/lambda-532",
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/network/vpn-420",
    "../../../../../../../../us-west-2/staging/operations/data/service-2/application/cache-layer-778",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-449?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-449"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}