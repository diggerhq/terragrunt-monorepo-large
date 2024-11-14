include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/data/service-1/compute/fargate-93",
    "../../../../../../../../us-west-2/dev/finance/platform/service-1/compute/auto-scaling-420",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-3/compute/batch-855",
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/security/guardduty-146",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-38?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-38"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}