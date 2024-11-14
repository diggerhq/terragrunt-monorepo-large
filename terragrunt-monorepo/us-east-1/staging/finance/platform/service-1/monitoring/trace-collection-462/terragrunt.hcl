include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/application/service-1/compute/auto-scaling-492",
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/application/queue-105",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/security/security-hub-951",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-2/compute/batch-716",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-462?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-462"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}