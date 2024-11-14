include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/application/service-1/application/queue-348",
    "../../../../../../../../us-east-1/dev/operations/application/service-3/monitoring/grafana-884",
    "../../../../../../../../us-west-2/staging/marketing/data/service-3/monitoring/prometheus-303",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/compute/auto-scaling-773",
    "../../../../../../../../us-west-2/dev/operations/application/service-3/storage/fsx-517",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-162?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-162"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}