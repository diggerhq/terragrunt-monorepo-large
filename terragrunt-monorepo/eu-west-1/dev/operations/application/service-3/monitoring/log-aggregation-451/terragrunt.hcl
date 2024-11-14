include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/application/service-3/security/security-hub-407",
    "../../../../../../../../eu-west-1/qa/finance/application/service-1/application/load-balancer-65",
    "../../../../../../../../us-west-2/qa/finance/platform/service-2/network/direct-connect-395",
    "../../../../../../../../us-east-1/staging/finance/application/service-2/storage/s3-996",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-451?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-451"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}