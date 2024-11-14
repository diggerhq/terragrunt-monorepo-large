include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/compute/eks-688",
    "../../../../../../../../us-west-2/qa/marketing/application/service-1/compute/fargate-654",
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/compute/fargate-242",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-413?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-413"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}