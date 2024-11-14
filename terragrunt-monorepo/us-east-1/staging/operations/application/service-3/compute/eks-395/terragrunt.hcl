include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/compute/spot-fleet-318",
    "../../../../../../../../eu-west-1/staging/finance/data/service-1/compute/fargate-816",
    "../../../../../../../../us-west-2/dev/operations/application/service-3/monitoring/alertmanager-655",
    "../../../../../../../../us-west-2/dev/operations/platform/service-3/storage/rds-54",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-395?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-395"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}