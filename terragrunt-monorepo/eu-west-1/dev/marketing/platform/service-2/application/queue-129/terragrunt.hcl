include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/data/service-2/security/security-hub-737",
    "../../../../../../../../us-west-2/dev/finance/data/service-1/monitoring/log-aggregation-538",
    "../../../../../../../../us-east-1/staging/operations/application/service-2/application/service-mesh-446",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-129?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-129"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}