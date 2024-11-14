include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/application/service-2/application/load-balancer-914",
    "../../../../../../../../eu-west-1/qa/operations/application/service-1/storage/fsx-3",
    "../../../../../../../../us-west-2/qa/marketing/data/service-1/application/api-gateway-31",
    "../../../../../../../../us-east-1/qa/finance/data/service-2/network/direct-connect-898",
    "../../../../../../../../us-west-2/dev/finance/application/service-2/storage/elasticache-913",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-226?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-226"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}