include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/application/service-3/compute/batch-220",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/storage/rds-211",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/storage/efs-927",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/compute/ec2-521",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/storage/fsx-617",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-77?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-77"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}