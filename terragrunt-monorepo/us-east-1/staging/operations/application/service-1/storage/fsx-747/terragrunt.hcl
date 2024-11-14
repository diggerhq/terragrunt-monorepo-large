include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/data/service-2/monitoring/log-aggregation-668",
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/security/security-hub-657",
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/compute/ecs-372",
    "../../../../../../../../us-east-1/qa/finance/data/service-3/monitoring/trace-collection-51",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-747?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-747"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}