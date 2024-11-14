include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/application/service-1/storage/redshift-422",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/storage/s3-103",
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/compute/spot-fleet-621",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-364?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-364"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}