include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/data/service-2/monitoring/trace-collection-780",
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/application/cache-layer-266",
    "../../../../../../../../us-west-2/staging/operations/data/service-1/compute/batch-885",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/storage/backup-226",
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/storage/rds-279",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-899?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-899"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}