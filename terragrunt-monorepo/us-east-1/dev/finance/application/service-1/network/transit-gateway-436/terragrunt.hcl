include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/application/service-1/storage/redshift-3",
    "../../../../../../../../us-west-2/staging/finance/application/service-2/security/certificates-34",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/network/vpn-448",
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/network/direct-connect-308",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-436?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-436"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}