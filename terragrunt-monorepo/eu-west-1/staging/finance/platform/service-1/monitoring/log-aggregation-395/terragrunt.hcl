include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/network/transit-gateway-74",
    "../../../../../../../../us-west-2/staging/operations/data/service-3/application/load-balancer-6",
    "../../../../../../../../eu-west-1/qa/operations/application/service-1/monitoring/cloudwatch-398",
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/monitoring/cloudwatch-327",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-395?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-395"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}