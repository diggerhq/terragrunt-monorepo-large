include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/application/service-3/compute/auto-scaling-544",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-1/monitoring/grafana-124",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/monitoring/trace-collection-360",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-1/monitoring/trace-collection-597",
    "../../../../../../../../us-east-1/dev/operations/platform/service-2/storage/dynamodb-702",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-913?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-913"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}