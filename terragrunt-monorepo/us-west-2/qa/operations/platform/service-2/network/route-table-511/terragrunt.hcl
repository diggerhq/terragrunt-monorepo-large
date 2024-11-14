include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/data/service-3/storage/efs-733",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/application/load-balancer-109",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-3/storage/s3-873",
    "../../../../../../../../us-east-1/qa/operations/application/service-2/security/certificates-127",
    "../../../../../../../../us-west-2/dev/marketing/application/service-2/monitoring/log-aggregation-274",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-511?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-511"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}