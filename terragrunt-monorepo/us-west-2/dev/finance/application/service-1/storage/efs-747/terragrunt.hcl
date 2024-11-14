include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/platform/service-1/storage/elasticache-259",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-3/monitoring/trace-collection-232",
    "../../../../../../../../eu-west-1/dev/operations/application/service-3/monitoring/alertmanager-151",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-747?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-747"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}