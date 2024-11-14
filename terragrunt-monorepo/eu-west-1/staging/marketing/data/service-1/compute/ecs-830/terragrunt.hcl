include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/application/service-3/compute/fargate-710",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/compute/eks-653",
    "../../../../../../../../us-east-1/staging/marketing/application/service-2/monitoring/log-aggregation-554",
    "../../../../../../../../us-east-1/staging/finance/platform/service-1/network/transit-gateway-588",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-830?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-830"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}