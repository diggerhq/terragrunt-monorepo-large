include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/network/vpc-243",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/compute/fargate-644",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-2/compute/ecs-883",
    "../../../../../../../../us-east-1/qa/finance/platform/service-1/compute/spot-fleet-994",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-852?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-852"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}