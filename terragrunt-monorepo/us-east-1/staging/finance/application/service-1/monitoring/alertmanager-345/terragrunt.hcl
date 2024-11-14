include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/data/service-1/storage/backup-325",
    "../../../../../../../../eu-west-1/qa/finance/data/service-3/security/shield-257",
    "../../../../../../../../us-east-1/dev/marketing/data/service-2/compute/ecs-597",
    "../../../../../../../../us-west-2/qa/operations/application/service-3/application/api-gateway-910",
    "../../../../../../../../us-west-2/dev/finance/data/service-3/monitoring/alertmanager-817",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-345?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-345"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}