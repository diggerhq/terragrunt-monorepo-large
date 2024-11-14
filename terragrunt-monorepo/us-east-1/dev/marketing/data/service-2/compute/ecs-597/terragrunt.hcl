include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/data/service-3/monitoring/trace-collection-415",
    "../../../../../../../../eu-west-1/qa/operations/application/service-1/security/kms-486",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/storage/redshift-768",
    "../../../../../../../../us-west-2/staging/marketing/data/service-3/monitoring/alertmanager-830",
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/monitoring/prometheus-356",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-597?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-597"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}