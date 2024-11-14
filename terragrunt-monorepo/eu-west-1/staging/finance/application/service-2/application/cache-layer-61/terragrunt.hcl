include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/application/service-2/compute/lambda-312",
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/storage/fsx-566",
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/compute/eks-936",
    "../../../../../../../../eu-west-1/staging/operations/data/service-3/application/load-balancer-523",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-61?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-61"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}