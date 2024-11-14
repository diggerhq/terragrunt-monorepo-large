include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/application/service-1/application/queue-348",
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/application/api-gateway-201",
    "../../../../../../../../us-east-1/qa/finance/data/service-1/monitoring/grafana-55",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/compute/eks-226",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-3/application/queue-297",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-675?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-675"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}