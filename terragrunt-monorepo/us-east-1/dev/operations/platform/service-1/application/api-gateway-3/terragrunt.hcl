include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/data/service-3/network/subnet-440",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/storage/elasticache-869",
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/compute/eks-58",
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/storage/redshift-334",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-3?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-3"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}