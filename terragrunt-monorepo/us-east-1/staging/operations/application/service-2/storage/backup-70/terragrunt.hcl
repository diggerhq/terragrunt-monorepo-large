include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/application/service-2/monitoring/prometheus-151",
    "../../../../../../../../us-east-1/staging/operations/data/service-3/monitoring/cloudwatch-296",
    "../../../../../../../../us-east-1/qa/finance/data/service-1/compute/batch-498",
    "../../../../../../../../eu-west-1/dev/operations/data/service-1/compute/ec2-899",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-2/monitoring/alertmanager-230",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-70?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-70"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}