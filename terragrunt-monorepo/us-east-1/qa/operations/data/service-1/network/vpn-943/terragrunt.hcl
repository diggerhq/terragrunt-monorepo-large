include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/monitoring/log-aggregation-879",
    "../../../../../../../../us-west-2/staging/finance/application/service-1/monitoring/cloudwatch-958",
    "../../../../../../../../us-west-2/dev/finance/data/service-2/storage/backup-776",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-943?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-943"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}