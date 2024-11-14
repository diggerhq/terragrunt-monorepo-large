include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/security/guardduty-407",
    "../../../../../../../../us-west-2/staging/finance/application/service-3/compute/ec2-226",
    "../../../../../../../../eu-west-1/staging/operations/application/service-3/monitoring/alertmanager-224",
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/network/direct-connect-622",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/compute/batch-892",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-435?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-435"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}