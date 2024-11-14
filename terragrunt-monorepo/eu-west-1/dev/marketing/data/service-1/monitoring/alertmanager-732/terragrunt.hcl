include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/storage/s3-313",
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/security/iam-489",
    "../../../../../../../../us-west-2/dev/marketing/application/service-3/security/kms-37",
    "../../../../../../../../us-west-2/staging/operations/application/service-2/storage/efs-60",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/monitoring/cloudwatch-678",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-732?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-732"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}