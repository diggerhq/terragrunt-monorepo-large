include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/security/kms-978",
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/monitoring/cloudwatch-22",
    "../../../../../../../../us-east-1/staging/finance/data/service-2/monitoring/trace-collection-819",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/monitoring/trace-collection-367",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-808?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-808"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}