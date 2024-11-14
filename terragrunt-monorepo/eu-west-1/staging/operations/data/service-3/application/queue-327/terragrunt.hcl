include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/monitoring/alertmanager-756",
    "../../../../../../../../us-west-2/dev/finance/data/service-1/network/transit-gateway-372",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/network/vpn-560",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-327?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-327"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}