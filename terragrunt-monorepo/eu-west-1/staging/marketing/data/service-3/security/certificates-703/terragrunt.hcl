include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/platform/service-2/monitoring/log-aggregation-393",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/storage/elasticache-981",
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/monitoring/alertmanager-719",
    "../../../../../../../../us-west-2/staging/operations/data/service-3/storage/redshift-370",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-703?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-703"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}