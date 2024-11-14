include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/application/service-2/storage/s3-304",
    "../../../../../../../../us-west-2/dev/finance/platform/service-1/security/certificates-852",
    "../../../../../../../../us-west-2/qa/marketing/data/service-3/monitoring/alertmanager-261",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-3/monitoring/trace-collection-203",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/monitoring/trace-collection-27",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-405?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-405"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}