include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/application/load-balancer-98",
    "../../../../../../../../us-east-1/dev/finance/data/service-3/network/direct-connect-11",
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/storage/dynamodb-829",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/monitoring/trace-collection-856",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/network/endpoint-633",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//s3-966?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "s3-966"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}