include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/compute/ecs-459",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-1/application/load-balancer-677",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/compute/lambda-500",
    "../../../../../../../../us-west-2/dev/finance/application/service-3/application/load-balancer-237",
    "../../../../../../../../us-east-1/dev/finance/application/service-3/application/cache-layer-471",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-250?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-250"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}