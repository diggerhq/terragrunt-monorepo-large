include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/platform/service-3/application/load-balancer-892",
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/monitoring/grafana-623",
    "../../../../../../../../eu-west-1/dev/finance/application/service-2/network/vpc-349",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-2/monitoring/prometheus-576",
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/storage/s3-21",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-937?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-937"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}