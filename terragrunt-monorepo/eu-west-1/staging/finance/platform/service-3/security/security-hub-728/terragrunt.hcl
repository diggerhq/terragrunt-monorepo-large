include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/data/service-3/compute/ecs-618",
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/network/endpoint-816",
    "../../../../../../../../us-east-1/dev/marketing/application/service-2/security/guardduty-899",
    "../../../../../../../../us-west-2/staging/marketing/data/service-3/network/direct-connect-386",
    "../../../../../../../../us-east-1/dev/finance/application/service-3/storage/redshift-28",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-728?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-728"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}