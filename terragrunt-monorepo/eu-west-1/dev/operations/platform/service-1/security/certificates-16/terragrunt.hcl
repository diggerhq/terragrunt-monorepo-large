include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/data/service-3/monitoring/alertmanager-455",
    "../../../../../../../../us-west-2/dev/operations/platform/service-3/monitoring/alertmanager-156",
    "../../../../../../../../us-west-2/staging/operations/data/service-1/security/certificates-251",
    "../../../../../../../../us-east-1/qa/finance/data/service-3/storage/efs-733",
    "../../../../../../../../us-west-2/staging/finance/application/service-1/security/shield-548",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-16?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-16"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}