include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/platform/service-3/network/vpn-485",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-3/storage/dynamodb-409",
    "../../../../../../../../us-west-2/staging/finance/data/service-1/monitoring/cloudwatch-525",
    "../../../../../../../../eu-west-1/qa/finance/data/service-2/storage/efs-913",
    "../../../../../../../../us-west-2/dev/marketing/application/service-2/monitoring/log-aggregation-478",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//s3-311?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "s3-311"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}