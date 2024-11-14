include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/data/service-2/application/load-balancer-803",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-1/storage/backup-505",
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/application/event-bus-555",
    "../../../../../../../../us-west-2/dev/operations/platform/service-1/application/load-balancer-411",
    "../../../../../../../../us-east-1/dev/finance/platform/service-3/application/event-bus-377",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-258?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-258"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}