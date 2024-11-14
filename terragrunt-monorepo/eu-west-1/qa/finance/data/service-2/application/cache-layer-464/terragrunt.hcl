include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/application/service-1/network/vpn-960",
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/security/secrets-742",
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/application/service-mesh-175",
    "../../../../../../../../us-west-2/qa/operations/application/service-1/compute/fargate-706",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-464?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-464"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}