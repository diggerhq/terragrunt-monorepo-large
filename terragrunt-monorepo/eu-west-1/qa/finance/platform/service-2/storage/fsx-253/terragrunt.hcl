include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-2/application/queue-129",
    "../../../../../../../../eu-west-1/qa/operations/application/service-3/security/waf-316",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-2/application/service-mesh-268",
    "../../../../../../../../us-east-1/dev/marketing/application/service-2/monitoring/alertmanager-166",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/monitoring/trace-collection-360",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-253?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-253"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}