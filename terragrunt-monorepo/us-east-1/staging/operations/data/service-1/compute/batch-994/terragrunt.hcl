include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/platform/service-3/network/subnet-212",
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/storage/backup-255",
    "../../../../../../../../us-west-2/staging/operations/data/service-1/compute/spot-fleet-325",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-1/monitoring/trace-collection-402",
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/storage/backup-396",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-994?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-994"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}