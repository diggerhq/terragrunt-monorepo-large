include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/data/service-3/compute/ecs-121",
    "../../../../../../../../us-east-1/staging/marketing/data/service-3/application/queue-168",
    "../../../../../../../../us-west-2/staging/finance/platform/service-3/compute/eks-866",
    "../../../../../../../../us-east-1/dev/finance/platform/service-3/application/load-balancer-213",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-646?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-646"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}