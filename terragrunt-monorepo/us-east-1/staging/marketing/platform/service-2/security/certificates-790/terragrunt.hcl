include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-2/monitoring/grafana-679",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-2/application/queue-281",
    "../../../../../../../../us-east-1/staging/finance/application/service-2/application/cache-layer-103",
    "../../../../../../../../us-west-2/dev/operations/platform/service-2/monitoring/alertmanager-791",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-790?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-790"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}