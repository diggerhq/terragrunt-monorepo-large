include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/compute/ec2-852",
    "../../../../../../../../eu-west-1/qa/finance/application/service-1/application/load-balancer-124",
    "../../../../../../../../us-west-2/staging/finance/data/service-3/network/transit-gateway-923",
    "../../../../../../../../us-east-1/qa/finance/data/service-2/compute/ecs-833",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-61?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-61"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}