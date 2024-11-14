include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/application/service-2/compute/ec2-420",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-1/security/security-hub-326",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/storage/efs-574",
    "../../../../../../../../us-west-2/qa/finance/application/service-3/monitoring/log-aggregation-636",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-915?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-915"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}