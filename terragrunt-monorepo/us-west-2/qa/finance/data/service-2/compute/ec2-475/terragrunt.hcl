include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/monitoring/prometheus-620",
    "../../../../../../../../us-east-1/dev/finance/application/service-3/application/cache-layer-63",
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/compute/lambda-774",
    "../../../../../../../../us-east-1/dev/finance/application/service-1/storage/rds-848",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-475?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-475"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}