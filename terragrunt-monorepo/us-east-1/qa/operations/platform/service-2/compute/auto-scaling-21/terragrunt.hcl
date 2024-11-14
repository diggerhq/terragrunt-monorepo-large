include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/application/service-3/application/cache-layer-63",
    "../../../../../../../../us-west-2/dev/marketing/application/service-3/monitoring/cloudwatch-523",
    "../../../../../../../../us-west-2/staging/operations/data/service-2/compute/eks-129",
    "../../../../../../../../us-west-2/dev/operations/platform/service-3/compute/auto-scaling-924",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-2/monitoring/cloudwatch-596",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-21?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-21"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}