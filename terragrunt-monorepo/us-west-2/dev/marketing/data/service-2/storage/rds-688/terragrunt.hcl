include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/compute/ec2-833",
    "../../../../../../../../eu-west-1/qa/operations/application/service-1/network/transit-gateway-634",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/application/load-balancer-862",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-2/application/cache-layer-712",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-688?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-688"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}