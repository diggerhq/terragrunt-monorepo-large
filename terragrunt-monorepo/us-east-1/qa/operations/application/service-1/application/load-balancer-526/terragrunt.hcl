include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/application/service-1/application/service-mesh-212",
    "../../../../../../../../us-east-1/staging/operations/data/service-3/compute/spot-fleet-331",
    "../../../../../../../../us-east-1/qa/finance/data/service-3/network/vpc-878",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/storage/rds-169",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-526?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-526"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}