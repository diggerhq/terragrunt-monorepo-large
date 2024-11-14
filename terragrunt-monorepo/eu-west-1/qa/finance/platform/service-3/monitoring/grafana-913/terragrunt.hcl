include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/data/service-2/monitoring/cloudwatch-923",
    "../../../../../../../../us-west-2/staging/operations/application/service-3/storage/efs-588",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-1/application/event-bus-713",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/compute/fargate-541",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-913?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-913"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}