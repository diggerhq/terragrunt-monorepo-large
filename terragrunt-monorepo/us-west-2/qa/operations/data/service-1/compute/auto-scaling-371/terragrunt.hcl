include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/application/service-1/security/waf-129",
    "../../../../../../../../us-east-1/staging/finance/platform/service-1/compute/lambda-155",
    "../../../../../../../../us-west-2/dev/operations/platform/service-2/monitoring/alertmanager-791",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-2/storage/efs-114",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-371?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-371"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}