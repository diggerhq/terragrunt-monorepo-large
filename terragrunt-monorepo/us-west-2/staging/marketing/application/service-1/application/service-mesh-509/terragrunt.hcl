include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/data/service-3/compute/ec2-135",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-3/application/cache-layer-556",
    "../../../../../../../../us-west-2/dev/operations/data/service-1/monitoring/log-aggregation-496",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-509?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-509"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}