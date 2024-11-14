include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/platform/service-1/monitoring/prometheus-123",
    "../../../../../../../../us-east-1/staging/operations/data/service-2/monitoring/cloudwatch-187",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-2/security/certificates-292",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-217?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-217"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}