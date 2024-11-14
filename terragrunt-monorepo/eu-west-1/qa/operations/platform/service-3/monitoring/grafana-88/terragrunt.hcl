include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/data/service-3/network/endpoint-707",
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/compute/eks-52",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-3/storage/s3-929",
    "../../../../../../../../us-east-1/qa/marketing/application/service-3/monitoring/log-aggregation-704",
    "../../../../../../../../us-east-1/dev/marketing/application/service-3/monitoring/grafana-603",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-88?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-88"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}