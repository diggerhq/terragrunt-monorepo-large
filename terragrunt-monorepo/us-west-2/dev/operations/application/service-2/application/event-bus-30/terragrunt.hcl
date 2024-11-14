include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/application/service-2/network/endpoint-364",
    "../../../../../../../../us-east-1/qa/marketing/data/service-2/application/service-mesh-275",
    "../../../../../../../../us-west-2/qa/marketing/data/service-3/compute/fargate-397",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-1/network/subnet-684",
    "../../../../../../../../us-east-1/dev/operations/data/service-1/application/api-gateway-170",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-30?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-30"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}