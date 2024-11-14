include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/platform/service-1/application/event-bus-713",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/storage/fsx-157",
    "../../../../../../../../us-west-2/qa/operations/platform/service-2/monitoring/cloudwatch-854",
    "../../../../../../../../us-west-2/dev/operations/application/service-2/storage/s3-969",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-573?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-573"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}