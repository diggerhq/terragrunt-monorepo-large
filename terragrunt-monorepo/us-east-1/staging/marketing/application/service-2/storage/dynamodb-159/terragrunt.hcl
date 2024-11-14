include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/data/service-3/monitoring/trace-collection-250",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/network/transit-gateway-942",
    "../../../../../../../../us-west-2/staging/operations/data/service-1/network/route-table-597",
    "../../../../../../../../us-east-1/dev/finance/application/service-2/storage/dynamodb-590",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-159?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-159"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}