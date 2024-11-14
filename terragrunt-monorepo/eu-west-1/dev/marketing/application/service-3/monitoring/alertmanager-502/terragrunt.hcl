include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/application/service-2/compute/eks-692",
    "../../../../../../../../us-east-1/staging/finance/data/service-3/application/cache-layer-557",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/application/api-gateway-383",
    "../../../../../../../../us-east-1/dev/operations/data/service-3/storage/dynamodb-352",
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/network/vpn-394",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-502?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-502"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}