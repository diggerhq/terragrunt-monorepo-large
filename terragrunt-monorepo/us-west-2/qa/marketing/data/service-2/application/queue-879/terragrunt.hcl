include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/data/service-3/compute/eks-834",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/storage/dynamodb-222",
    "../../../../../../../../us-west-2/staging/operations/application/service-2/application/queue-143",
    "../../../../../../../../us-west-2/dev/finance/application/service-3/monitoring/trace-collection-58",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-879?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-879"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}