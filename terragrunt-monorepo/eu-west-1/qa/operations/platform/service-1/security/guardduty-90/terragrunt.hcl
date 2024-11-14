include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/network/route-table-763",
    "../../../../../../../../us-east-1/qa/finance/platform/service-1/storage/fsx-606",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/security/kms-78",
    "../../../../../../../../us-east-1/dev/operations/application/service-2/compute/auto-scaling-399",
    "../../../../../../../../us-east-1/qa/operations/data/service-2/compute/lambda-567",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-90?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-90"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}