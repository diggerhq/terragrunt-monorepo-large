include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/data/service-2/storage/s3-961",
    "../../../../../../../../us-west-2/dev/operations/platform/service-2/network/direct-connect-584",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/compute/ec2-259",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-3/network/subnet-569",
    "../../../../../../../../us-east-1/qa/operations/platform/service-2/monitoring/trace-collection-636",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-367?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-367"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}