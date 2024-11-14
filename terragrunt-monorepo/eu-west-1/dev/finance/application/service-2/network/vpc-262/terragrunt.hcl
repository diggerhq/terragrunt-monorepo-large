include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/application/service-1/security/guardduty-532",
    "../../../../../../../../us-east-1/qa/finance/data/service-2/storage/elasticache-578",
    "../../../../../../../../us-east-1/qa/marketing/application/service-3/security/kms-500",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-1/security/waf-222",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-262?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-262"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}