include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/compute/auto-scaling-561",
    "../../../../../../../../us-east-1/dev/marketing/data/service-2/application/queue-581",
    "../../../../../../../../us-west-2/dev/operations/application/service-3/storage/fsx-403",
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/storage/redshift-764",
    "../../../../../../../../us-east-1/staging/operations/application/service-1/network/vpc-368",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-531?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-531"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}