include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/application/load-balancer-109",
    "../../../../../../../../us-east-1/qa/finance/application/service-3/storage/backup-787",
    "../../../../../../../../eu-west-1/qa/operations/application/service-1/compute/batch-921",
    "../../../../../../../../us-west-2/qa/operations/application/service-1/monitoring/grafana-634",
    "../../../../../../../../us-west-2/dev/operations/application/service-3/security/waf-9",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-175?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-175"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}