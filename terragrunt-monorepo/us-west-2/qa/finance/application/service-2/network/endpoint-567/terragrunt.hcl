include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-3/security/security-hub-909",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/application/event-bus-37",
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/application/service-mesh-423",
    "../../../../../../../../us-west-2/staging/operations/application/service-1/network/endpoint-419",
    "../../../../../../../../us-east-1/staging/operations/application/service-2/application/service-mesh-446",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-567?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-567"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}