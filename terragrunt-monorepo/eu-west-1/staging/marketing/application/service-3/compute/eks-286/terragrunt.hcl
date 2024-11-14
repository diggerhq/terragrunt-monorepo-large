include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/application/cache-layer-242",
    "../../../../../../../../us-west-2/qa/operations/data/service-3/security/shield-665",
    "../../../../../../../../us-west-2/dev/finance/data/service-2/compute/eks-818",
    "../../../../../../../../us-east-1/qa/operations/application/service-3/compute/ec2-715",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-286?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-286"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}