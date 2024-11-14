include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/data/service-2/network/subnet-383",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/application/queue-698",
    "../../../../../../../../us-east-1/dev/operations/data/service-2/application/service-mesh-27",
    "../../../../../../../../us-west-2/staging/operations/platform/service-2/compute/batch-659",
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/security/guardduty-618",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-651?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-651"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}