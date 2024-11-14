include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/data/service-3/application/api-gateway-751",
    "../../../../../../../../us-east-1/qa/operations/application/service-3/application/load-balancer-841",
    "../../../../../../../../us-east-1/qa/operations/application/service-1/compute/ec2-726",
    "../../../../../../../../us-west-2/staging/operations/platform/service-2/monitoring/prometheus-226",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-630?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-630"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}