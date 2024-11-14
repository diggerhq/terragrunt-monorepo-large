include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/data/service-1/compute/fargate-816",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/storage/fsx-509",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/compute/auto-scaling-615",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/application/api-gateway-729",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/network/vpn-122",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-174?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-174"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}