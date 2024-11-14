include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/monitoring/trace-collection-481",
    "../../../../../../../../us-east-1/staging/finance/data/service-3/storage/dynamodb-553",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/compute/fargate-559",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/network/nacl-938",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//kms-21?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "kms-21"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}