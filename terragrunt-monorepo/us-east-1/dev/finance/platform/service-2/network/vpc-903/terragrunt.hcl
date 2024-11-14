include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/security/iam-958",
    "../../../../../../../../us-west-2/staging/finance/platform/service-2/network/route-table-933",
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/network/endpoint-310",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/security/iam-21",
    "../../../../../../../../us-west-2/dev/marketing/data/service-2/storage/rds-688",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-903?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-903"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}