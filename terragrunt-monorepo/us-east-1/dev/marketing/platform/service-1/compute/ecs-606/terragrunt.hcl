include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/application/service-3/application/load-balancer-441",
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/network/vpc-892",
    "../../../../../../../../us-east-1/dev/finance/platform/service-3/security/kms-715",
    "../../../../../../../../us-west-2/dev/finance/data/service-2/compute/eks-818",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/storage/efs-361",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-606?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-606"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}