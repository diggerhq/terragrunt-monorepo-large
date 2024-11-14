include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/data/service-3/storage/redshift-528",
    "../../../../../../../../us-west-2/qa/marketing/application/service-2/network/transit-gateway-556",
    "../../../../../../../../us-west-2/staging/marketing/data/service-3/compute/eks-862",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/storage/elasticache-981",
    "../../../../../../../../us-east-1/staging/operations/data/service-2/network/endpoint-727",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-39?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-39"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}