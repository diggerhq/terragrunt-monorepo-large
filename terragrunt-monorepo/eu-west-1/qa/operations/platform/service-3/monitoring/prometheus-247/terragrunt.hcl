include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/security/guardduty-406",
    "../../../../../../../../us-east-1/dev/operations/data/service-1/compute/spot-fleet-136",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/application/queue-641",
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/network/vpn-188",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-247?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-247"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}