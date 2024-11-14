include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/application/service-2/network/nacl-533",
    "../../../../../../../../us-east-1/dev/operations/platform/service-2/security/waf-776",
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/monitoring/log-aggregation-189",
    "../../../../../../../../us-west-2/qa/finance/application/service-1/monitoring/alertmanager-596",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//elasticache-793?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "elasticache-793"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}