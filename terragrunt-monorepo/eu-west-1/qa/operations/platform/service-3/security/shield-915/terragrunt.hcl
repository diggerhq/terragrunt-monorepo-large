include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-2/network/route-table-317",
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/compute/ec2-690",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/storage/rds-170",
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/monitoring/trace-collection-57",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-3/monitoring/trace-collection-699",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-915?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-915"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}