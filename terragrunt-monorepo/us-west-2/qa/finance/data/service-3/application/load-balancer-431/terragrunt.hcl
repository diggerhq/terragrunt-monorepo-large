include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/monitoring/trace-collection-856",
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/application/service-mesh-208",
    "../../../../../../../../us-east-1/dev/operations/platform/service-3/monitoring/cloudwatch-450",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-431?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-431"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}