include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/data/service-2/storage/rds-741",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/monitoring/prometheus-85",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/security/security-hub-428",
    "../../../../../../../../us-west-2/staging/operations/platform/service-3/monitoring/grafana-946",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-97?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-97"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}