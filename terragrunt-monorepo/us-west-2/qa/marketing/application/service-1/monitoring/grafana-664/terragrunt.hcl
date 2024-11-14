include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/security/guardduty-933",
    "../../../../../../../../us-east-1/qa/operations/data/service-2/application/api-gateway-801",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-3/network/nacl-421",
    "../../../../../../../../us-east-1/qa/marketing/data/service-2/network/subnet-559",
    "../../../../../../../../us-east-1/dev/operations/application/service-1/application/cache-layer-312",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-664?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-664"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}