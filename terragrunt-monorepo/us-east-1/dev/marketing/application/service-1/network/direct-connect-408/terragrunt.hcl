include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/data/service-3/application/service-mesh-415",
    "../../../../../../../../us-west-2/staging/finance/platform/service-3/application/load-balancer-369",
    "../../../../../../../../us-west-2/dev/finance/data/service-2/compute/lambda-282",
    "../../../../../../../../us-west-2/staging/operations/application/service-2/storage/dynamodb-355",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-2/network/route-table-926",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-408?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-408"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}