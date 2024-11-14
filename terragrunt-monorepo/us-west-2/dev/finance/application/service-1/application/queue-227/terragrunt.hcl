include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/application/service-2/security/security-hub-11",
    "../../../../../../../../us-west-2/dev/operations/data/service-1/application/cache-layer-904",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/monitoring/prometheus-808",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-227?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-227"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}