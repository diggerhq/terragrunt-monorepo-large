include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/storage/s3-63",
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/compute/lambda-523",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/network/endpoint-712",
    "../../../../../../../../us-west-2/staging/operations/platform/service-1/monitoring/log-aggregation-898",
    "../../../../../../../../us-west-2/staging/finance/application/service-3/application/load-balancer-441",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-78?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-78"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}