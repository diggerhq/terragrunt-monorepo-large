include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/monitoring/cloudwatch-61",
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/network/endpoint-683",
    "../../../../../../../../us-west-2/dev/operations/application/service-2/application/queue-430",
    "../../../../../../../../us-west-2/staging/marketing/data/service-3/security/shield-651",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-849?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-849"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}