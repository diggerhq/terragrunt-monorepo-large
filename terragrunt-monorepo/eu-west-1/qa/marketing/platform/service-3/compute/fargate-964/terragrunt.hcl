include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/platform/service-2/storage/backup-271",
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/network/endpoint-124",
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/storage/redshift-764",
    "../../../../../../../../us-west-2/qa/operations/data/service-1/storage/backup-285",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-3/security/kms-188",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fargate-964?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fargate-964"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}