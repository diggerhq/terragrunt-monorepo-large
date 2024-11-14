include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/data/service-3/compute/ec2-782",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-1/storage/dynamodb-612",
    "../../../../../../../../us-east-1/dev/operations/data/service-1/security/iam-435",
    "../../../../../../../../us-east-1/dev/operations/platform/service-3/compute/auto-scaling-884",
    "../../../../../../../../us-west-2/qa/finance/application/service-1/monitoring/cloudwatch-600",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-67?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-67"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}