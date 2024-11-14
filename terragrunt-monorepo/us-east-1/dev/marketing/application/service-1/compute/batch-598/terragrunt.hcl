include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/security/security-hub-387",
    "../../../../../../../../us-west-2/dev/marketing/application/service-3/network/vpn-86",
    "../../../../../../../../us-west-2/qa/operations/application/service-1/storage/elasticache-64",
    "../../../../../../../../us-east-1/staging/finance/data/service-2/storage/dynamodb-34",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-598?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-598"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}