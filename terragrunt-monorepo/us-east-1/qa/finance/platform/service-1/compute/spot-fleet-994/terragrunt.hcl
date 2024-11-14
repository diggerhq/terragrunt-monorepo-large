include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/data/service-3/storage/dynamodb-999",
    "../../../../../../../../us-east-1/dev/finance/platform/service-2/application/cache-layer-640",
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/monitoring/grafana-800",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-994?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-994"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}