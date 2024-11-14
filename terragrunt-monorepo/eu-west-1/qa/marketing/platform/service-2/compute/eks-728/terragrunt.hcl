include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/monitoring/log-aggregation-159",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-3/storage/elasticache-912",
    "../../../../../../../../us-west-2/qa/finance/application/service-1/security/certificates-175",
    "../../../../../../../../eu-west-1/dev/operations/data/service-1/storage/redshift-852",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/security/guardduty-553",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-728?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-728"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}