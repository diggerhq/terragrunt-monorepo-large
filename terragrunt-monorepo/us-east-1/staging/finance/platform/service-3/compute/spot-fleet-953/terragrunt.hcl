include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/platform/service-2/storage/dynamodb-18",
    "../../../../../../../../us-west-2/qa/operations/data/service-3/storage/efs-304",
    "../../../../../../../../us-east-1/staging/finance/application/service-1/monitoring/alertmanager-345",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/compute/ec2-521",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-953?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-953"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}