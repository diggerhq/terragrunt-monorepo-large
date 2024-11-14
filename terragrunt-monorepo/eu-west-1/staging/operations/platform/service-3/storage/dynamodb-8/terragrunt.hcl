include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/compute/auto-scaling-991",
    "../../../../../../../../us-east-1/staging/marketing/data/service-3/application/queue-897",
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/compute/eks-883",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/monitoring/log-aggregation-436",
    "../../../../../../../../us-west-2/dev/marketing/data/service-2/monitoring/trace-collection-417",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-8?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-8"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}