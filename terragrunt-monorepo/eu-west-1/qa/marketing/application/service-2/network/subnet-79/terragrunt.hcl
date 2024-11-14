include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/platform/service-3/storage/backup-458",
    "../../../../../../../../us-west-2/qa/marketing/data/service-3/storage/rds-809",
    "../../../../../../../../us-east-1/dev/finance/data/service-3/security/security-hub-892",
    "../../../../../../../../us-west-2/staging/finance/application/service-1/compute/auto-scaling-805",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-79?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-79"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}