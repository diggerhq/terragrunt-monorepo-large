include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/platform/service-3/compute/spot-fleet-845",
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/application/event-bus-685",
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/compute/ec2-568",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/compute/batch-562",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//kms-426?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "kms-426"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}