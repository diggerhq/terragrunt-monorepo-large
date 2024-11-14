include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/security/shield-197",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/application/cache-layer-935",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/monitoring/alertmanager-748",
    "../../../../../../../../us-west-2/staging/operations/data/service-1/compute/batch-885",
    "../../../../../../../../us-west-2/dev/operations/platform/service-3/monitoring/alertmanager-156",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-69?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-69"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}