include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/compute/spot-fleet-51",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/storage/backup-177",
    "../../../../../../../../us-east-1/dev/marketing/application/service-2/network/direct-connect-649",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/monitoring/cloudwatch-572",
    "../../../../../../../../eu-west-1/dev/operations/application/service-3/application/cache-layer-60",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-105?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-105"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}