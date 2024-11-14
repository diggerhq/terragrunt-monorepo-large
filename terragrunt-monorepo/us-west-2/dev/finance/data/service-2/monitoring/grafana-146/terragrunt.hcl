include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/storage/rds-715",
    "../../../../../../../../us-east-1/staging/operations/platform/service-3/network/direct-connect-795",
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/application/event-bus-108",
    "../../../../../../../../us-east-1/qa/operations/application/service-3/storage/efs-995",
    "../../../../../../../../us-east-1/staging/operations/application/service-1/security/iam-605",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-146?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-146"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}