include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/data/service-2/compute/ecs-967",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fargate-379?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fargate-379"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}