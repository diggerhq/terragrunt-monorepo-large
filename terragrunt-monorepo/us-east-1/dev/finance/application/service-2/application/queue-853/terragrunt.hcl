include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/data/service-3/security/kms-236",
    "../../../../../../../../us-west-2/qa/marketing/application/service-1/monitoring/grafana-664",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/compute/auto-scaling-954",
    "../../../../../../../../us-east-1/qa/finance/application/service-3/application/cache-layer-6",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-853?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-853"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}