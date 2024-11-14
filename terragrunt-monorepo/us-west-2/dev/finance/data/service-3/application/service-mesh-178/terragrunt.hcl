include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/platform/service-3/monitoring/grafana-894",
    "../../../../../../../../us-west-2/staging/finance/platform/service-2/monitoring/grafana-34",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/compute/ecs-659",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/security/security-hub-428",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/storage/fsx-617",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-178?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-178"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}