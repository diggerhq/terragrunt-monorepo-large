include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/data/service-2/compute/batch-766",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/compute/ec2-168",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/compute/auto-scaling-849",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/network/transit-gateway-362",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//s3-624?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "s3-624"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}