include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/application/service-2/security/security-hub-656",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-3/monitoring/prometheus-486",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-2/monitoring/trace-collection-69",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-1/application/queue-887",
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/monitoring/alertmanager-748",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-28?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-28"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}