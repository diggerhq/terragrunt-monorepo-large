include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/platform/service-1/application/queue-823",
    "../../../../../../../../us-west-2/staging/finance/application/service-2/storage/elasticache-81",
    "../../../../../../../../us-west-2/qa/operations/platform/service-2/network/direct-connect-850",
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/storage/rds-687",
    "../../../../../../../../us-west-2/dev/operations/platform/service-2/monitoring/trace-collection-310",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-900?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-900"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}