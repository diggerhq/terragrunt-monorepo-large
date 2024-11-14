include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/application/service-1/storage/s3-576",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-2/monitoring/cloudwatch-602",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-3/network/subnet-365",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-181?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-181"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}