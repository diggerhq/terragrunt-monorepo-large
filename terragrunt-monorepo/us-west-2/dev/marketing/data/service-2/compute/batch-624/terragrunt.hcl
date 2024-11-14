include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/security/certificates-876",
    "../../../../../../../../us-east-1/dev/marketing/application/service-2/network/subnet-774",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/storage/s3-63",
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/monitoring/log-aggregation-19",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-624?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-624"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}