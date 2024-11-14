include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/storage/elasticache-64",
    "../../../../../../../../us-east-1/staging/operations/data/service-2/monitoring/alertmanager-491",
    "../../../../../../../../us-east-1/qa/finance/platform/service-1/security/guardduty-22",
    "../../../../../../../../us-east-1/qa/marketing/application/service-3/compute/auto-scaling-825",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-326?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-326"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}