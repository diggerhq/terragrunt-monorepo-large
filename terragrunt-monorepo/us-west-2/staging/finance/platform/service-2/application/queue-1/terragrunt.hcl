include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/monitoring/trace-collection-97",
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/compute/eks-916",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/network/endpoint-963",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-2/monitoring/alertmanager-230",
    "../../../../../../../../us-east-1/dev/operations/platform/service-1/storage/rds-592",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-1?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-1"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}