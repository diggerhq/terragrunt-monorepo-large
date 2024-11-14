include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/data/service-2/compute/ecs-833",
    "../../../../../../../../us-east-1/qa/finance/data/service-2/storage/elasticache-689",
    "../../../../../../../../us-east-1/dev/finance/application/service-3/compute/lambda-827",
    "../../../../../../../../us-east-1/staging/operations/platform/service-3/network/vpc-180",
    "../../../../../../../../us-east-1/staging/operations/data/service-3/compute/auto-scaling-686",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-440?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-440"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}