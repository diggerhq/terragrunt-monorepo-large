include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/application/service-2/monitoring/log-aggregation-97",
    "../../../../../../../../us-west-2/qa/operations/data/service-1/security/kms-848",
    "../../../../../../../../us-west-2/qa/marketing/application/service-3/compute/auto-scaling-123",
    "../../../../../../../../us-west-2/staging/finance/application/service-2/security/iam-43",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-285?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-285"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}