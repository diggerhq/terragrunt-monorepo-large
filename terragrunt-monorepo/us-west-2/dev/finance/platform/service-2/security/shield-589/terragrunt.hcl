include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/network/vpc-180",
    "../../../../../../../../us-west-2/qa/marketing/data/service-2/monitoring/prometheus-742",
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/application/load-balancer-164",
    "../../../../../../../../us-east-1/qa/finance/platform/service-1/compute/ec2-468",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-589?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-589"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}