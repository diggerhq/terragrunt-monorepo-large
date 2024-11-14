include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/platform/service-2/compute/lambda-459",
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/storage/rds-153",
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/application/event-bus-685",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-3/storage/s3-738",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-324?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-324"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}