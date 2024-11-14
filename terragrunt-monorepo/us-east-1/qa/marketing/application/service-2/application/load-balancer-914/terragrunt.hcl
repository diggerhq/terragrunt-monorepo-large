include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/data/service-3/compute/ec2-782",
    "../../../../../../../../us-west-2/dev/operations/data/service-1/compute/eks-905",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/application/event-bus-37",
    "../../../../../../../../us-east-1/staging/finance/platform/service-1/monitoring/log-aggregation-513",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-914?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-914"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}