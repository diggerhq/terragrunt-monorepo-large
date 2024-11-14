include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/application/service-3/compute/eks-499",
    "../../../../../../../../us-east-1/qa/marketing/application/service-3/storage/dynamodb-357",
    "../../../../../../../../us-west-2/qa/finance/platform/service-1/application/cache-layer-475",
    "../../../../../../../../us-west-2/staging/finance/application/service-1/application/api-gateway-176",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-436?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-436"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}