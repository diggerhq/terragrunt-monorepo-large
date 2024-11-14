include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-1/compute/spot-fleet-130",
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/compute/auto-scaling-386",
    "../../../../../../../../us-west-2/dev/operations/application/service-2/compute/spot-fleet-102",
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/storage/backup-255",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-825?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-825"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}