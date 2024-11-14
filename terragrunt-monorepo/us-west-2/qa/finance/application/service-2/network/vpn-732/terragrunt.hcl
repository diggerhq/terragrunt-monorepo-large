include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/application/service-1/application/queue-877",
    "../../../../../../../../us-east-1/staging/finance/platform/service-3/security/kms-923",
    "../../../../../../../../us-west-2/dev/operations/application/service-1/compute/auto-scaling-407",
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/storage/redshift-598",
    "../../../../../../../../us-east-1/qa/marketing/application/service-2/storage/fsx-930",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-732?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-732"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}