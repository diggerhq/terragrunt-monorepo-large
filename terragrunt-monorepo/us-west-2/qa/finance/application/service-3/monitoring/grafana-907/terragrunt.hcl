include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/application/service-1/application/cache-layer-312",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/compute/eks-350",
    "../../../../../../../../us-east-1/qa/marketing/data/service-2/application/api-gateway-953",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/application/api-gateway-215",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-907?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-907"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}