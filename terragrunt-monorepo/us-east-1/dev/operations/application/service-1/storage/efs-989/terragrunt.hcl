include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/monitoring/prometheus-954",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-2/storage/dynamodb-238",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-2/monitoring/prometheus-54",
    "../../../../../../../../us-west-2/dev/marketing/application/service-1/storage/dynamodb-695",
    "../../../../../../../../us-east-1/dev/finance/application/service-1/monitoring/prometheus-391",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-989?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-989"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}