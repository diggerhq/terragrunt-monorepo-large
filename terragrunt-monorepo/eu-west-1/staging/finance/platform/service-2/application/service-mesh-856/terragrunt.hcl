include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/platform/service-3/storage/dynamodb-958",
    "../../../../../../../../eu-west-1/dev/finance/data/service-3/network/subnet-647",
    "../../../../../../../../us-east-1/dev/operations/data/service-2/compute/spot-fleet-635",
    "../../../../../../../../eu-west-1/dev/finance/application/service-3/storage/efs-378",
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/network/vpc-681",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-856?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-856"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}