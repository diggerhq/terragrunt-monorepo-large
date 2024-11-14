include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/data/service-2/application/load-balancer-736",
    "../../../../../../../../us-west-2/staging/finance/data/service-3/monitoring/trace-collection-415",
    "../../../../../../../../eu-west-1/staging/operations/application/service-3/security/certificates-962",
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/monitoring/trace-collection-644",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-5?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-5"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}