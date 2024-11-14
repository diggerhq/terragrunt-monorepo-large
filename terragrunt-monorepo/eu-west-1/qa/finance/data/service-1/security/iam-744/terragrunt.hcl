include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/monitoring/trace-collection-832",
    "../../../../../../../../us-east-1/qa/marketing/application/service-3/security/certificates-508",
    "../../../../../../../../eu-west-1/staging/operations/application/service-3/security/certificates-537",
    "../../../../../../../../eu-west-1/qa/finance/data/service-2/compute/auto-scaling-775",
    "../../../../../../../../us-west-2/qa/operations/data/service-3/compute/auto-scaling-598",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//iam-744?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "iam-744"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}