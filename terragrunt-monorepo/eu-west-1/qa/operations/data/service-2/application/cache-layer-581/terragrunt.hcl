include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/application/service-3/compute/eks-577",
    "../../../../../../../../us-east-1/qa/operations/platform/service-3/compute/ec2-647",
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/network/vpc-479",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/security/shield-366",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-581?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-581"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}