include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/data/service-3/monitoring/prometheus-639",
    "../../../../../../../../us-west-2/staging/finance/data/service-2/network/endpoint-924",
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/compute/ec2-110",
    "../../../../../../../../us-west-2/dev/operations/application/service-2/monitoring/prometheus-151",
    "../../../../../../../../eu-west-1/qa/operations/application/service-3/security/waf-316",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-460?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-460"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}