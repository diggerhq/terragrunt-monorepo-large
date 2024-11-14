include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/application/service-2/storage/s3-969",
    "../../../../../../../../us-west-2/dev/operations/platform/service-3/storage/s3-371",
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/compute/ec2-852",
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/storage/fsx-780",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/storage/elasticache-869",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-687?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-687"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}