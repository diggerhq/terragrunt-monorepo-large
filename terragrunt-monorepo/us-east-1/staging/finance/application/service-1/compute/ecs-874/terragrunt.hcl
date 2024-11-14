include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/compute/ec2-478",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/application/load-balancer-992",
    "../../../../../../../../us-east-1/staging/finance/application/service-1/monitoring/cloudwatch-406",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-874?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-874"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}