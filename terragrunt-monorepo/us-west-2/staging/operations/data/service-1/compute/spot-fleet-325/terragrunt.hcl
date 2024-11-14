include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/platform/service-1/storage/rds-789",
    "../../../../../../../../us-east-1/qa/marketing/application/service-2/storage/fsx-930",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/compute/lambda-30",
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/monitoring/cloudwatch-30",
    "../../../../../../../../us-west-2/staging/operations/data/service-1/network/route-table-597",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-325?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-325"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}