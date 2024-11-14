include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/application/service-1/monitoring/prometheus-576",
    "../../../../../../../../us-east-1/staging/finance/data/service-1/application/event-bus-23",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/storage/fsx-65",
    "../../../../../../../../us-east-1/staging/marketing/data/service-1/storage/dynamodb-146",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-3/storage/dynamodb-625",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-703?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-703"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}