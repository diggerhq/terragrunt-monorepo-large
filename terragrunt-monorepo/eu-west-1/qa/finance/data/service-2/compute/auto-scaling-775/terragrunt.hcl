include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/application/load-balancer-109",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/compute/ec2-413",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-3/monitoring/grafana-894",
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/application/queue-99",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-775?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-775"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}