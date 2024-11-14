include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/monitoring/cloudwatch-208",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/application/load-balancer-419",
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/monitoring/cloudwatch-661",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-440?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-440"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}