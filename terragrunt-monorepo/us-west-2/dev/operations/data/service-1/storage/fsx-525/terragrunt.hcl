include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/data/service-3/monitoring/cloudwatch-426",
    "../../../../../../../../us-east-1/staging/operations/application/service-1/monitoring/cloudwatch-556",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/monitoring/grafana-627",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-525?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-525"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}