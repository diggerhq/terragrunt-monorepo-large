include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/data/service-2/monitoring/log-aggregation-761",
    "../../../../../../../../us-west-2/qa/finance/application/service-3/monitoring/grafana-907",
    "../../../../../../../../us-east-1/qa/operations/data/service-2/compute/batch-291",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-336?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-336"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}