include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/application/service-2/application/api-gateway-625",
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/monitoring/grafana-500",
    "../../../../../../../../us-east-1/dev/operations/application/service-1/compute/auto-scaling-806",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-743?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-743"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}