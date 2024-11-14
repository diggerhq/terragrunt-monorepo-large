include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/data/service-3/security/waf-984",
    "../../../../../../../../us-east-1/staging/operations/platform/service-3/application/cache-layer-34",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/security/security-hub-795",
    "../../../../../../../../us-east-1/dev/finance/platform/service-2/monitoring/cloudwatch-724",
    "../../../../../../../../us-east-1/dev/operations/platform/service-3/security/iam-781",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-858?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-858"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}