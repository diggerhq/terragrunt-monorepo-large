include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/compute/ecs-459",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-2/compute/auto-scaling-996",
    "../../../../../../../../us-west-2/qa/operations/platform/service-3/storage/redshift-632",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/network/endpoint-650",
    "../../../../../../../../us-east-1/dev/finance/application/service-2/application/event-bus-905",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-402?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-402"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}