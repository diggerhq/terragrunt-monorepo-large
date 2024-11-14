include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/network/vpn-267",
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/network/vpc-892",
    "../../../../../../../../us-west-2/staging/finance/application/service-1/application/api-gateway-176",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/network/transit-gateway-456",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/security/security-hub-491",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-883?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-883"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}