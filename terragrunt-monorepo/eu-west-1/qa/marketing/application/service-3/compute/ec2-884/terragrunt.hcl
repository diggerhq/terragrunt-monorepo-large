include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/data/service-2/application/service-mesh-168",
    "../../../../../../../../us-west-2/qa/marketing/application/service-3/network/vpn-532",
    "../../../../../../../../us-east-1/staging/finance/platform/service-1/monitoring/trace-collection-462",
    "../../../../../../../../us-east-1/qa/operations/application/service-3/network/subnet-551",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-884?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-884"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}