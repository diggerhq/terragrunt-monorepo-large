include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/platform/service-1/monitoring/log-aggregation-173",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/application/api-gateway-126",
    "../../../../../../../../us-east-1/dev/finance/platform/service-2/compute/eks-281",
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/monitoring/trace-collection-726",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fargate-441?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fargate-441"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}