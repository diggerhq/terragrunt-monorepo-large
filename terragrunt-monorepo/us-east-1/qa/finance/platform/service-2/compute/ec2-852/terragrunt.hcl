include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/data/service-1/compute/batch-548",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/storage/s3-103",
    "../../../../../../../../us-west-2/qa/operations/data/service-3/compute/ecs-990",
    "../../../../../../../../us-west-2/qa/operations/platform/service-1/compute/batch-389",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-852?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-852"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}