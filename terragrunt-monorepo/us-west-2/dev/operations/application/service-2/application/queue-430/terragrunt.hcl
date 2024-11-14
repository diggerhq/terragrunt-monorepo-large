include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/compute/ecs-374",
    "../../../../../../../../eu-west-1/qa/finance/data/service-1/security/iam-744",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/network/transit-gateway-76",
    "../../../../../../../../us-west-2/dev/finance/application/service-2/network/subnet-990",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-1/storage/rds-647",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-430?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-430"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}