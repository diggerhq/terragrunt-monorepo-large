include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/platform/service-3/monitoring/trace-collection-578",
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/security/guardduty-432",
    "../../../../../../../../us-east-1/qa/operations/platform/service-3/compute/auto-scaling-365",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-670?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-670"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}