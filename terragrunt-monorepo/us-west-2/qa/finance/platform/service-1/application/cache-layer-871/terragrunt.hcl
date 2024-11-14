include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/data/service-1/application/queue-925",
    "../../../../../../../../us-west-2/qa/marketing/data/service-2/compute/batch-766",
    "../../../../../../../../us-west-2/qa/operations/application/service-1/compute/ec2-546",
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/application/load-balancer-480",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-871?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-871"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}