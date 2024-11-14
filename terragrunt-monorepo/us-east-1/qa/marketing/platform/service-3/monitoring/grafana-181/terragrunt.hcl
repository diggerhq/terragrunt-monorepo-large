include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/application/service-1/network/endpoint-419",
    "../../../../../../../../us-east-1/staging/finance/application/service-3/storage/redshift-319",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-1/monitoring/trace-collection-61",
    "../../../../../../../../us-west-2/dev/finance/data/service-2/storage/backup-776",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-181?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-181"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}