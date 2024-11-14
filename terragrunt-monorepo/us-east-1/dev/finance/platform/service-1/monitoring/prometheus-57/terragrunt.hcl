include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/data/service-3/application/queue-897",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/monitoring/prometheus-34",
    "../../../../../../../../us-east-1/dev/finance/application/service-2/monitoring/log-aggregation-884",
    "../../../../../../../../us-east-1/staging/finance/application/service-3/storage/rds-945",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-57?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-57"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}