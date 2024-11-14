include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/application/service-1/security/kms-505",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/security/iam-958",
    "../../../../../../../../us-west-2/dev/operations/platform/service-3/network/subnet-695",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/monitoring/alertmanager-871",
    "../../../../../../../../us-west-2/qa/marketing/application/service-2/compute/auto-scaling-335",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-980?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-980"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}