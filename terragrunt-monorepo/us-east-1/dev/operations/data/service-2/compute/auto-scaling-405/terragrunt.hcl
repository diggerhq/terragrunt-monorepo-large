include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/monitoring/cloudwatch-854",
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/storage/elasticache-864",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/compute/auto-scaling-615",
    "../../../../../../../../us-west-2/qa/finance/platform/service-2/storage/rds-850",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-1/security/security-hub-44",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-405?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-405"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}