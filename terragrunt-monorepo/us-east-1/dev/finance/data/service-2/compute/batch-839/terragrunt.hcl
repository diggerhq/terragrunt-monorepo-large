include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/application/service-2/network/route-table-572",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/network/subnet-189",
    "../../../../../../../../us-west-2/dev/operations/data/service-1/network/route-table-159",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-2/security/certificates-334",
    "../../../../../../../../us-west-2/qa/marketing/data/service-3/security/kms-807",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-839?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-839"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}