include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/application/service-1/application/queue-48",
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/application/api-gateway-945",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/application/cache-layer-996",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-3/network/vpn-178",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//elasticache-801?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "elasticache-801"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}