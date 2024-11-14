include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/storage/redshift-869",
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/security/security-hub-657",
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/monitoring/trace-collection-642",
    "../../../../../../../../eu-west-1/qa/finance/data/service-1/monitoring/alertmanager-511",
    "../../../../../../../../us-west-2/dev/marketing/data/service-2/storage/redshift-498",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-191?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-191"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}