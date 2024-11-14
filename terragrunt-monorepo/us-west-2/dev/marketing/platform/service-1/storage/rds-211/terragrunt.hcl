include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/data/service-2/monitoring/cloudwatch-312",
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/storage/s3-701",
    "../../../../../../../../us-west-2/staging/finance/data/service-3/storage/backup-594",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/application/cache-layer-942",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/application/api-gateway-126",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-211?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-211"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}