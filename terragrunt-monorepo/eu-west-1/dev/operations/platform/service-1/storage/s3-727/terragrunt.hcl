include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/application/service-3/storage/s3-21",
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/compute/fargate-659",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-1/security/shield-659",
    "../../../../../../../../us-east-1/qa/operations/application/service-1/security/kms-505",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/monitoring/alertmanager-985",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//s3-727?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "s3-727"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}