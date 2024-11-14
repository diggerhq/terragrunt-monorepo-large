include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/application/load-balancer-376",
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/application/load-balancer-940",
    "../../../../../../../../us-east-1/qa/finance/platform/service-1/application/service-mesh-506",
    "../../../../../../../../us-east-1/dev/operations/data/service-2/storage/efs-120",
    "../../../../../../../../us-west-2/staging/finance/application/service-2/compute/eks-253",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-74?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-74"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}