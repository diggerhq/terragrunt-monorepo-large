include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/platform/service-1/storage/elasticache-259",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-1/storage/s3-518",
    "../../../../../../../../us-west-2/qa/marketing/application/service-3/application/event-bus-697",
    "../../../../../../../../us-west-2/staging/operations/data/service-1/monitoring/cloudwatch-341",
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/network/direct-connect-622",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-347?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-347"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}