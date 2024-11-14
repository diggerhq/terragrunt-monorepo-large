include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/application/service-2/storage/backup-197",
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/application/queue-551",
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/storage/rds-443",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/security/secrets-121",
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/compute/auto-scaling-611",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-613?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-613"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}