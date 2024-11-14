include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/data/service-2/network/endpoint-687",
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/compute/batch-798",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-2/compute/eks-808",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/storage/elasticache-165",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-800?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-800"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}