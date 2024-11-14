include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/platform/service-3/security/secrets-905",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/security/guardduty-887",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/security/certificates-46",
    "../../../../../../../../us-west-2/qa/operations/platform/service-2/network/route-table-511",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-181?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-181"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}