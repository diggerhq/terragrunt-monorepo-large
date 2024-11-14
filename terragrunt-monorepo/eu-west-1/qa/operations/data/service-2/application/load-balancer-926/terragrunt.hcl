include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/platform/service-1/storage/dynamodb-584",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/security/certificates-330",
    "../../../../../../../../us-west-2/dev/finance/platform/service-1/application/cache-layer-342",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-926?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-926"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}