include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/data/service-2/network/transit-gateway-949",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/security/security-hub-278",
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/network/vpc-430",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-387?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-387"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}