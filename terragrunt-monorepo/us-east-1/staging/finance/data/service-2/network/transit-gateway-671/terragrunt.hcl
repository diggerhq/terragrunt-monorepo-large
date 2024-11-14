include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/application/service-2/network/route-table-807",
    "../../../../../../../../us-east-1/dev/operations/application/service-2/storage/dynamodb-373",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-2/storage/s3-903",
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/monitoring/grafana-905",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-671?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-671"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}