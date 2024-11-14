include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/application/service-3/security/waf-896",
    "../../../../../../../../us-west-2/qa/marketing/data/service-2/application/event-bus-584",
    "../../../../../../../../us-east-1/staging/finance/application/service-2/network/transit-gateway-416",
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/security/shield-183",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-360?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-360"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}