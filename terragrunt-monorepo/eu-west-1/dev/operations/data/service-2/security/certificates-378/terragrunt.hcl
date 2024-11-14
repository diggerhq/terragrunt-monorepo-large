include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/application/service-1/monitoring/trace-collection-182",
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/compute/ec2-803",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/network/vpn-837",
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/compute/batch-374",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-1/monitoring/prometheus-163",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-378?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-378"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}