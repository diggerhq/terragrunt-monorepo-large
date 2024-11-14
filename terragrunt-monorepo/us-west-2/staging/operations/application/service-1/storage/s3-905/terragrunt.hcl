include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/compute/eks-353",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/compute/auto-scaling-7",
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/application/cache-layer-266",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//s3-905?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "s3-905"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}