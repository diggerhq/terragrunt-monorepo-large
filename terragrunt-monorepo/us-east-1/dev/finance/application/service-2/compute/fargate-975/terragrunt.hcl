include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/data/service-2/application/cache-layer-778",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/compute/fargate-19",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/application/api-gateway-276",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-3/network/endpoint-677",
    "../../../../../../../../us-west-2/staging/finance/platform/service-2/application/queue-1",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fargate-975?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fargate-975"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}