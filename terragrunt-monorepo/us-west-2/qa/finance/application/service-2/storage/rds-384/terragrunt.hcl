include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/storage/rds-169",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/monitoring/prometheus-240",
    "../../../../../../../../us-west-2/qa/finance/data/service-2/application/service-mesh-799",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/compute/lambda-721",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-384?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-384"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}