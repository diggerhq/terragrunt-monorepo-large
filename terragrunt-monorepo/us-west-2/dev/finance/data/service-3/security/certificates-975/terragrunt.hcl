include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/application/service-2/monitoring/grafana-384",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/monitoring/alertmanager-415",
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/monitoring/alertmanager-756",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-975?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-975"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}