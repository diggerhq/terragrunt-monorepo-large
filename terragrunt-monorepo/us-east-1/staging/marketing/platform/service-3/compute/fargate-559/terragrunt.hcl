include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/network/vpc-36",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/compute/ecs-496",
    "../../../../../../../../us-west-2/qa/marketing/application/service-1/monitoring/alertmanager-386",
    "../../../../../../../../us-east-1/qa/finance/data/service-2/application/service-mesh-982",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/application/api-gateway-966",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fargate-559?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fargate-559"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}