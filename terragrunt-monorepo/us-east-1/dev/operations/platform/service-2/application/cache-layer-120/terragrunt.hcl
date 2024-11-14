include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/application/service-3/security/security-hub-10",
    "../../../../../../../../us-west-2/staging/operations/platform/service-1/application/service-mesh-143",
    "../../../../../../../../us-west-2/qa/finance/application/service-1/monitoring/cloudwatch-600",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/storage/dynamodb-670",
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/network/nacl-600",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-120?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-120"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}