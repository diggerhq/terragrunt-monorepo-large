include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/data/service-1/application/api-gateway-170",
    "../../../../../../../../us-east-1/staging/finance/platform/service-2/monitoring/cloudwatch-998",
    "../../../../../../../../us-east-1/staging/finance/data/service-2/network/transit-gateway-321",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-674?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-674"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}