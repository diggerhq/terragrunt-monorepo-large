include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/application/service-1/storage/elasticache-269",
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/storage/elasticache-352",
    "../../../../../../../../eu-west-1/dev/finance/application/service-3/compute/spot-fleet-379",
    "../../../../../../../../us-west-2/staging/marketing/data/service-3/network/vpc-145",
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/security/certificates-928",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-862?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-862"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}