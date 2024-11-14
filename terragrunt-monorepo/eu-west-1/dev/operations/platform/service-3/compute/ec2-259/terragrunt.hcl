include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/application/service-1/monitoring/grafana-970",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/application/load-balancer-109",
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/network/transit-gateway-778",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-259?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-259"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}