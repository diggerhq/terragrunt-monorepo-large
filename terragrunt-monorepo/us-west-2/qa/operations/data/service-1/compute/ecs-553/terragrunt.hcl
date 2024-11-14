include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/compute/fargate-479",
    "../../../../../../../../us-east-1/dev/finance/platform/service-2/application/cache-layer-640",
    "../../../../../../../../us-west-2/qa/marketing/data/service-1/compute/ec2-870",
    "../../../../../../../../us-east-1/qa/finance/data/service-2/compute/auto-scaling-398",
    "../../../../../../../../us-east-1/dev/operations/platform/service-1/storage/redshift-78",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-553?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-553"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}