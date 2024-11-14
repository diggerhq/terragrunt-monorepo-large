include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/data/service-2/monitoring/alertmanager-707",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/network/nacl-668",
    "../../../../../../../../us-east-1/dev/finance/application/service-3/storage/redshift-698",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-1/storage/dynamodb-303",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-638?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-638"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}