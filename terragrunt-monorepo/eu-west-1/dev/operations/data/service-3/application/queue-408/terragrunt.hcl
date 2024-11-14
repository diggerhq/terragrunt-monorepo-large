include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/platform/service-2/compute/eks-867",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/application/cache-layer-195",
    "../../../../../../../../us-west-2/qa/marketing/data/service-3/storage/efs-430",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/network/vpc-208",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-408?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-408"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}