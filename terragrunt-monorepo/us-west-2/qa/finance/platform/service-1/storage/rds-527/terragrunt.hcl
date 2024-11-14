include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/application/service-3/monitoring/cloudwatch-390",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/monitoring/log-aggregation-395",
    "../../../../../../../../us-east-1/staging/finance/application/service-1/application/service-mesh-629",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-1/application/load-balancer-5",
    "../../../../../../../../us-east-1/qa/marketing/application/service-3/security/certificates-508",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-527?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-527"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}