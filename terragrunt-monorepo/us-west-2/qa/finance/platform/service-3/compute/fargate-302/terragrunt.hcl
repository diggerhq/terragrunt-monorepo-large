include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/compute/lambda-307",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/storage/redshift-485",
    "../../../../../../../../us-west-2/qa/finance/application/service-2/monitoring/log-aggregation-798",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fargate-302?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fargate-302"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}