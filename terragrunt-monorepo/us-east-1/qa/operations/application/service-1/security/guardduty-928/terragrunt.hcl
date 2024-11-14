include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/application/service-mesh-250",
    "../../../../../../../../eu-west-1/qa/finance/application/service-1/compute/batch-38",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/compute/spot-fleet-281",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/storage/backup-350",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-3/storage/fsx-894",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-928?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-928"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}