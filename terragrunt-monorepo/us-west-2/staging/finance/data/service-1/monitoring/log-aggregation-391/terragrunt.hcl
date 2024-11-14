include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/security/guardduty-34",
    "../../../../../../../../us-east-1/qa/marketing/data/service-3/monitoring/trace-collection-837",
    "../../../../../../../../us-west-2/dev/finance/application/service-1/monitoring/grafana-937",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-391?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-391"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}