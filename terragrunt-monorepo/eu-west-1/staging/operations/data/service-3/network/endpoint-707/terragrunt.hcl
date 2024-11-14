include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/data/service-3/compute/ec2-135",
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/storage/elasticache-69",
    "../../../../../../../../us-west-2/staging/operations/data/service-2/storage/s3-622",
    "../../../../../../../../us-west-2/staging/operations/platform/service-1/monitoring/prometheus-123",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-707?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-707"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}