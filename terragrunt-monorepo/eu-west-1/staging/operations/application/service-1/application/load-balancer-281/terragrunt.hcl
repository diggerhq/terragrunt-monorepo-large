include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/application/service-1/monitoring/alertmanager-380",
    "../../../../../../../../us-west-2/qa/finance/platform/service-2/storage/rds-850",
    "../../../../../../../../us-west-2/staging/finance/application/service-2/application/load-balancer-275",
    "../../../../../../../../us-west-2/qa/finance/application/service-1/compute/fargate-718",
    "../../../../../../../../us-west-2/staging/finance/application/service-2/compute/eks-253",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-281?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-281"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}