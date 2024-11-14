include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/application/service-3/security/guardduty-37",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-1/monitoring/cloudwatch-876",
    "../../../../../../../../eu-west-1/dev/finance/application/service-2/security/security-hub-441",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-1/application/service-mesh-845",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-197?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-197"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}