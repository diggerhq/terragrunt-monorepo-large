include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/security/guardduty-336",
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/storage/redshift-611",
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/application/api-gateway-697",
    "../../../../../../../../us-west-2/staging/finance/data/service-2/monitoring/log-aggregation-736",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-839?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-839"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}