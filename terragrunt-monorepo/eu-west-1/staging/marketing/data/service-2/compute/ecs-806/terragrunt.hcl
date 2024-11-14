include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/application/service-2/monitoring/cloudwatch-874",
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/compute/ec2-973",
    "../../../../../../../../us-west-2/qa/marketing/data/service-1/network/subnet-596",
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/application/cache-layer-55",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-806?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-806"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}