include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/application/service-1/compute/lambda-310",
    "../../../../../../../../us-east-1/staging/finance/application/service-2/monitoring/alertmanager-481",
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/compute/spot-fleet-62",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-663?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-663"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}