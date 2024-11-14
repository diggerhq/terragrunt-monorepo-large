include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-1/network/vpn-971",
    "../../../../../../../../us-west-2/staging/operations/platform/service-3/storage/redshift-318",
    "../../../../../../../../us-east-1/dev/operations/data/service-2/security/iam-43",
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/compute/auto-scaling-373",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-1/security/certificates-869",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-409?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-409"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}