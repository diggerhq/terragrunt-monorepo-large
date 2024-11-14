include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/application/service-1/monitoring/prometheus-726",
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/application/service-mesh-94",
    "../../../../../../../../us-west-2/qa/finance/application/service-1/monitoring/alertmanager-563",
    "../../../../../../../../us-west-2/staging/finance/platform/service-2/application/queue-609",
    "../../../../../../../../us-west-2/qa/marketing/application/service-2/application/event-bus-904",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-712?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-712"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}