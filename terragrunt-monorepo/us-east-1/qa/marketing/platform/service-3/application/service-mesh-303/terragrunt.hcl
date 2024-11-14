include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/network/transit-gateway-226",
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/compute/ec2-774",
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/compute/fargate-485",
    "../../../../../../../../us-east-1/dev/finance/platform/service-2/monitoring/grafana-483",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-303?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-303"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}