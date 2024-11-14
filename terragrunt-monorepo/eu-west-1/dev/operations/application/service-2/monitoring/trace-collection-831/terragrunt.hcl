include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/data/service-2/storage/dynamodb-536",
    "../../../../../../../../us-east-1/dev/marketing/application/service-3/compute/fargate-907",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/compute/ec2-265",
    "../../../../../../../../us-east-1/dev/marketing/application/service-2/monitoring/log-aggregation-736",
    "../../../../../../../../us-east-1/dev/operations/platform/service-1/security/shield-161",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-831?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-831"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}