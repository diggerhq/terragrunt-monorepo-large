include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/application/service-1/network/subnet-21",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/security/shield-383",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/security/secrets-121",
    "../../../../../../../../us-west-2/dev/marketing/data/service-2/monitoring/prometheus-894",
    "../../../../../../../../us-east-1/staging/finance/application/service-1/monitoring/log-aggregation-440",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-907?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-907"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}