include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/platform/service-1/application/load-balancer-927",
    "../../../../../../../../us-west-2/staging/finance/application/service-1/security/shield-548",
    "../../../../../../../../us-east-1/staging/operations/platform/service-3/network/vpc-180",
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/storage/rds-922",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-296?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-296"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}