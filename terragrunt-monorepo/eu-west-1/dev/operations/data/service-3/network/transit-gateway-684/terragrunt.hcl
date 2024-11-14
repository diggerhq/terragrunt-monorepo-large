include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/compute/spot-fleet-259",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/storage/redshift-499",
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/security/guardduty-852",
    "../../../../../../../../us-east-1/staging/finance/application/service-1/network/direct-connect-952",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-684?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-684"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}