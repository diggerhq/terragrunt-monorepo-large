include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/platform/service-2/network/direct-connect-904",
    "../../../../../../../../us-west-2/qa/finance/application/service-2/application/service-mesh-168",
    "../../../../../../../../us-east-1/dev/operations/application/service-2/monitoring/log-aggregation-909",
    "../../../../../../../../us-west-2/dev/finance/data/service-3/security/security-hub-737",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-1/monitoring/log-aggregation-172",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//s3-892?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "s3-892"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}