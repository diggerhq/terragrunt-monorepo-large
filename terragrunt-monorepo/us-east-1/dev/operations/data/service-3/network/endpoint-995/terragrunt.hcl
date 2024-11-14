include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/application/service-3/monitoring/cloudwatch-916",
    "../../../../../../../../us-west-2/dev/marketing/data/service-2/storage/redshift-498",
    "../../../../../../../../us-east-1/staging/finance/platform/service-3/security/iam-902",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-1/compute/lambda-141",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-995?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-995"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}