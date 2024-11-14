include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/platform/service-3/monitoring/log-aggregation-888",
    "../../../../../../../../us-east-1/dev/finance/application/service-1/application/service-mesh-212",
    "../../../../../../../../us-east-1/qa/finance/platform/service-1/storage/backup-942",
    "../../../../../../../../eu-west-1/dev/finance/application/service-1/application/load-balancer-224",
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/application/queue-306",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-370?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-370"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}