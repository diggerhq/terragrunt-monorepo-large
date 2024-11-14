include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/platform/service-1/monitoring/trace-collection-462",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-1/network/transit-gateway-738",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-3/application/event-bus-605",
    "../../../../../../../../us-west-2/staging/finance/platform/service-3/security/security-hub-129",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-233?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-233"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}