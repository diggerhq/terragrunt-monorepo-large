include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/application/service-2/network/nacl-956",
    "../../../../../../../../us-east-1/qa/marketing/application/service-3/security/certificates-407",
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/security/certificates-480",
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/monitoring/trace-collection-446",
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/monitoring/log-aggregation-133",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-507?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-507"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}