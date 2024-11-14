include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/application/service-2/monitoring/alertmanager-560",
    "../../../../../../../../us-west-2/staging/operations/application/service-3/application/queue-849",
    "../../../../../../../../us-east-1/staging/finance/data/service-2/security/security-hub-194",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/network/nacl-339",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-1?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-1"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}