include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/application/service-3/network/subnet-849",
    "../../../../../../../../us-west-2/qa/finance/data/service-1/security/waf-266",
    "../../../../../../../../us-east-1/staging/finance/application/service-3/monitoring/trace-collection-282",
    "../../../../../../../../us-west-2/dev/operations/application/service-3/monitoring/log-aggregation-490",
    "../../../../../../../../us-west-2/qa/operations/platform/service-3/security/iam-634",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-849?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-849"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}