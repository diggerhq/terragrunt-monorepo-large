include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/application/service-1/storage/efs-444",
    "../../../../../../../../us-east-1/dev/finance/data/service-2/monitoring/alertmanager-707",
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/monitoring/alertmanager-568",
    "../../../../../../../../us-east-1/qa/operations/application/service-2/storage/dynamodb-132",
    "../../../../../../../../us-west-2/dev/operations/application/service-3/compute/spot-fleet-149",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-746?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-746"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}