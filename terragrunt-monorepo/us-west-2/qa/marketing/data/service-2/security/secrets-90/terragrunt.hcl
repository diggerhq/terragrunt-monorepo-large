include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/application/service-2/application/event-bus-861",
    "../../../../../../../../us-east-1/dev/marketing/data/service-2/network/transit-gateway-83",
    "../../../../../../../../us-west-2/qa/operations/application/service-1/compute/fargate-706",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/application/load-balancer-98",
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/network/vpn-779",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-90?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-90"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}