include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/data/service-1/security/waf-849",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-1/monitoring/log-aggregation-172",
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/storage/backup-6",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/application/queue-924",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-777?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-777"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}