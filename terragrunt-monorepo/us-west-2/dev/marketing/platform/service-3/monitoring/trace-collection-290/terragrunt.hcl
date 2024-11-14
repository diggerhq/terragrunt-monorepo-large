include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/compute/batch-798",
    "../../../../../../../../us-east-1/dev/marketing/application/service-2/monitoring/trace-collection-231",
    "../../../../../../../../eu-west-1/dev/operations/application/service-3/network/direct-connect-434",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-3/security/iam-571",
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/storage/rds-998",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-290?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-290"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}