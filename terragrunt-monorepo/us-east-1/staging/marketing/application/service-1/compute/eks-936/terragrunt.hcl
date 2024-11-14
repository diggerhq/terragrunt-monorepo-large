include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/application/service-1/compute/auto-scaling-899",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/compute/fargate-511",
    "../../../../../../../../eu-west-1/qa/finance/application/service-1/storage/elasticache-165",
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/network/vpn-394",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-936?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-936"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}