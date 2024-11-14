include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/network/nacl-81",
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/storage/fsx-766",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-2/security/security-hub-11",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-3/compute/fargate-989",
    "../../../../../../../../us-east-1/dev/operations/platform/service-2/storage/dynamodb-702",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-417?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-417"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}