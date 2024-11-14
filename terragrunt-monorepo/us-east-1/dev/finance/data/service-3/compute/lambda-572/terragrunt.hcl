include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/data/service-1/storage/fsx-227",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-3/security/iam-882",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/compute/fargate-944",
    "../../../../../../../../us-east-1/staging/finance/platform/service-3/monitoring/prometheus-359",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//lambda-572?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "lambda-572"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}