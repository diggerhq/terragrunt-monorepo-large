include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/data/service-1/network/vpn-122",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-2/application/service-mesh-63",
    "../../../../../../../../us-west-2/qa/finance/data/service-3/storage/efs-691",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/monitoring/log-aggregation-112",
    "../../../../../../../../us-east-1/qa/operations/data/service-2/security/guardduty-887",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-666?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-666"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}