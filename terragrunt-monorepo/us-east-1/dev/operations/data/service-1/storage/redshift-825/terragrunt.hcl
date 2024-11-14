include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/data/service-2/storage/elasticache-853",
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/security/iam-40",
    "../../../../../../../../us-west-2/staging/finance/data/service-1/storage/efs-956",
    "../../../../../../../../us-east-1/dev/finance/platform/service-2/network/vpc-903",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-2/security/guardduty-276",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-825?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-825"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}