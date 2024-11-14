include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/data/service-1/compute/ec2-214",
    "../../../../../../../../us-west-2/qa/marketing/data/service-1/network/vpn-374",
    "../../../../../../../../us-east-1/dev/operations/data/service-2/security/waf-541",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/storage/dynamodb-620",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/monitoring/log-aggregation-112",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//s3-951?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "s3-951"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}