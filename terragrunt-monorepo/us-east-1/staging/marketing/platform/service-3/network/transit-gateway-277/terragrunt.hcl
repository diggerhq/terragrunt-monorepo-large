include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/application/service-2/network/endpoint-567",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/network/vpc-19",
    "../../../../../../../../us-east-1/staging/operations/application/service-2/monitoring/alertmanager-65",
    "../../../../../../../../us-west-2/qa/finance/data/service-3/compute/fargate-843",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-277?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-277"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}