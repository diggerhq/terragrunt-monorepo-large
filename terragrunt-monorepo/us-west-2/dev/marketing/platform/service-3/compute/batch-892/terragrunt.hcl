include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/data/service-1/monitoring/cloudwatch-645",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/storage/dynamodb-835",
    "../../../../../../../../us-west-2/qa/operations/application/service-2/compute/ecs-679",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-892?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-892"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}