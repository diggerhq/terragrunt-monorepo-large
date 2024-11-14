include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/network/route-table-19",
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/storage/s3-746",
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/storage/fsx-944",
    "../../../../../../../../us-west-2/staging/operations/application/service-1/compute/ec2-981",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-930?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-930"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}