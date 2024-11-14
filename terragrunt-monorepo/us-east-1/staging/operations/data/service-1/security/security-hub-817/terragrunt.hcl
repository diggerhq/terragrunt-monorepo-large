include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/platform/service-2/compute/batch-177",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-3/storage/backup-551",
    "../../../../../../../../us-west-2/qa/operations/data/service-3/application/event-bus-516",
    "../../../../../../../../us-east-1/staging/finance/application/service-2/network/vpc-242",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-3/compute/ec2-41",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-817?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-817"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}