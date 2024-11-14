include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-2/network/endpoint-793",
    "../../../../../../../../us-east-1/qa/marketing/data/service-3/security/iam-634",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/compute/fargate-559",
    "../../../../../../../../us-east-1/staging/marketing/data/service-1/application/load-balancer-29",
    "../../../../../../../../us-west-2/staging/finance/application/service-1/compute/batch-718",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fargate-360?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fargate-360"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}