include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/application/service-3/security/kms-766",
    "../../../../../../../../us-east-1/staging/operations/data/service-2/storage/redshift-247",
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/storage/dynamodb-464",
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/compute/spot-fleet-875",
    "../../../../../../../../eu-west-1/dev/finance/application/service-2/security/security-hub-441",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-8?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-8"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}