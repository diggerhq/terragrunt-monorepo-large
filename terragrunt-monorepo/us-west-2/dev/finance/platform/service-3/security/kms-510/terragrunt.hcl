include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/platform/service-2/application/service-mesh-758",
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/monitoring/log-aggregation-879",
    "../../../../../../../../us-east-1/staging/operations/application/service-1/application/event-bus-882",
    "../../../../../../../../us-west-2/staging/operations/application/service-2/security/shield-340",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//kms-510?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "kms-510"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}