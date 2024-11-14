include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/monitoring/cloudwatch-587",
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/storage/efs-414",
    "../../../../../../../../us-west-2/qa/marketing/data/service-2/storage/s3-951",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/compute/ec2-704",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//lambda-310?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "lambda-310"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}