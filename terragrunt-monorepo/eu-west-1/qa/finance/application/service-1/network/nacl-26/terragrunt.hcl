include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/data/service-3/monitoring/grafana-968",
    "../../../../../../../../us-west-2/qa/marketing/data/service-3/monitoring/alertmanager-261",
    "../../../../../../../../us-east-1/dev/marketing/data/service-2/network/subnet-877",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//nacl-26?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "nacl-26"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}