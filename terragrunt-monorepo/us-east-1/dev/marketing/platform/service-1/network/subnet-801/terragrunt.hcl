include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/application/service-3/network/subnet-778",
    "../../../../../../../../us-east-1/dev/operations/platform/service-3/compute/auto-scaling-884",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/compute/eks-556",
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/monitoring/grafana-583",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-801?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-801"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}