include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/storage/rds-534",
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/monitoring/trace-collection-905",
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/network/subnet-379",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/monitoring/trace-collection-538",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-859?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-859"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}