include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/application/service-1/network/nacl-452",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/compute/auto-scaling-781",
    "../../../../../../../../us-east-1/dev/operations/application/service-2/compute/fargate-814",
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/monitoring/trace-collection-423",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-128?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-128"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}