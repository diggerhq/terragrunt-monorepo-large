include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/platform/service-3/monitoring/trace-collection-571",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/monitoring/grafana-681",
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/storage/fsx-41",
    "../../../../../../../../us-east-1/staging/finance/platform/service-3/compute/batch-933",
    "../../../../../../../../eu-west-1/dev/finance/data/service-3/compute/ec2-272",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-243?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-243"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}