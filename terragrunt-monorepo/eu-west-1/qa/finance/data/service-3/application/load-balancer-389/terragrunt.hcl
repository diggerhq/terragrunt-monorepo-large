include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/security/secrets-127",
    "../../../../../../../../us-east-1/staging/marketing/application/service-2/compute/batch-533",
    "../../../../../../../../us-east-1/staging/marketing/data/service-1/compute/spot-fleet-425",
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/compute/batch-598",
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/storage/backup-253",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-389?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-389"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}