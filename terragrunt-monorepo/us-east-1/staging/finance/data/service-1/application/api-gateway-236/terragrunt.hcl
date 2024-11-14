include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/data/service-2/network/subnet-383",
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/network/vpc-430",
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/compute/eks-606",
    "../../../../../../../../us-east-1/staging/finance/application/service-1/application/event-bus-168",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-1/security/shield-952",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-236?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-236"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}