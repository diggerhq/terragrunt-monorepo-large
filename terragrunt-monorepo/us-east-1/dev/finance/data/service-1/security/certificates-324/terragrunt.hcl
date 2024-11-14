include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/application/service-3/application/queue-659",
    "../../../../../../../../us-west-2/dev/finance/data/service-2/security/iam-520",
    "../../../../../../../../us-west-2/dev/finance/platform/service-1/monitoring/prometheus-574",
    "../../../../../../../../us-east-1/dev/operations/platform/service-1/monitoring/alertmanager-258",
    "../../../../../../../../us-east-1/staging/marketing/data/service-3/network/subnet-440",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-324?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-324"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}