include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/security/waf-24",
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/application/cache-layer-903",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-611?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-611"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}