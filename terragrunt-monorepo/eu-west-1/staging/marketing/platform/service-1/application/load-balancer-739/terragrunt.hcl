include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/data/service-3/monitoring/alertmanager-964",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/compute/eks-226",
    "../../../../../../../../us-east-1/qa/marketing/application/service-2/monitoring/grafana-900",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-2/storage/s3-688",
    "../../../../../../../../us-east-1/dev/finance/data/service-2/monitoring/trace-collection-877",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-739?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-739"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}