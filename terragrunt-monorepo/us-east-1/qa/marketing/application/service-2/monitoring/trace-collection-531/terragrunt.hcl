include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/application/service-2/network/endpoint-687",
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/network/vpc-479",
    "../../../../../../../../us-west-2/dev/finance/data/service-2/storage/backup-776",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/compute/fargate-379",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-531?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-531"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}