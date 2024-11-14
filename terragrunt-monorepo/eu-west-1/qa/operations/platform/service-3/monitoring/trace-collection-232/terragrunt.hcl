include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/data/service-1/monitoring/alertmanager-985",
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/application/queue-376",
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/security/kms-482",
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/application/event-bus-960",
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/security/guardduty-937",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-232?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-232"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}