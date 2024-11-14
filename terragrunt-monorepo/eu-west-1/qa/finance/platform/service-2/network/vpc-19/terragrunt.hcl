include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/storage/dynamodb-18",
    "../../../../../../../../us-west-2/staging/marketing/data/service-3/monitoring/grafana-585",
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/application/service-mesh-455",
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/application/queue-347",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-19?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-19"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}