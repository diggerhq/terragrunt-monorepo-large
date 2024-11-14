include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/application/service-3/monitoring/trace-collection-830",
    "../../../../../../../../us-west-2/qa/finance/platform/service-2/security/guardduty-992",
    "../../../../../../../../us-west-2/qa/operations/platform/service-3/compute/spot-fleet-214",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//iam-834?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "iam-834"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}