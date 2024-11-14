include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/compute/spot-fleet-366",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-3/application/service-mesh-303",
    "../../../../../../../../us-west-2/dev/operations/data/service-3/security/shield-141",
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/security/guardduty-555",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-3/application/queue-612",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-990?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-990"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}