include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/compute/fargate-985",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/application/service-mesh-958",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/network/route-table-455",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-2/monitoring/grafana-679",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-124?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-124"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}