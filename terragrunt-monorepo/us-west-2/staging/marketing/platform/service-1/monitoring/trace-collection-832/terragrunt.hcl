include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/application/service-2/compute/ec2-955",
    "../../../../../../../../us-west-2/qa/operations/application/service-1/compute/fargate-706",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/storage/s3-239",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-832?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-832"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}