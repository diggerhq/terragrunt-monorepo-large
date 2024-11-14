include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/application/service-2/security/shield-559",
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/application/api-gateway-639",
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/monitoring/log-aggregation-879",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/storage/rds-984",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-589?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-589"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}