include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/data/service-1/compute/auto-scaling-371",
    "../../../../../../../../us-west-2/staging/finance/application/service-1/storage/rds-473",
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/security/iam-926",
    "../../../../../../../../eu-west-1/staging/operations/application/service-3/application/queue-484",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-533?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-533"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}