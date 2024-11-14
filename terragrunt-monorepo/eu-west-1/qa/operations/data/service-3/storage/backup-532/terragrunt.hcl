include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/application/service-mesh-578",
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/storage/backup-862",
    "../../../../../../../../us-west-2/staging/finance/application/service-1/compute/batch-260",
    "../../../../../../../../us-east-1/dev/operations/data/service-3/security/iam-274",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/storage/efs-361",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-532?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-532"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}