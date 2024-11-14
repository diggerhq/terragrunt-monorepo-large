include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/application/service-1/application/service-mesh-674",
    "../../../../../../../../us-west-2/qa/operations/platform/service-2/monitoring/alertmanager-278",
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/security/certificates-142",
    "../../../../../../../../us-west-2/dev/finance/application/service-2/security/secrets-975",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-569?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-569"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}