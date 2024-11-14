include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/data/service-2/security/kms-157",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/monitoring/log-aggregation-727",
    "../../../../../../../../us-west-2/staging/finance/data/service-2/monitoring/cloudwatch-839",
    "../../../../../../../../us-east-1/staging/finance/data/service-2/storage/dynamodb-34",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-447?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-447"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}