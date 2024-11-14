include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/platform/service-3/compute/batch-181",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/monitoring/log-aggregation-149",
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/security/secrets-114",
    "../../../../../../../../us-west-2/staging/finance/application/service-3/compute/ec2-226",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-441?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-441"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}