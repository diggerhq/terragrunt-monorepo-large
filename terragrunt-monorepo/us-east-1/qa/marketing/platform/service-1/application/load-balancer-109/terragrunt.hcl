include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/data/service-2/monitoring/trace-collection-913",
    "../../../../../../../../us-east-1/dev/operations/platform/service-3/storage/backup-937",
    "../../../../../../../../us-west-2/dev/operations/data/service-3/compute/fargate-531",
    "../../../../../../../../us-east-1/qa/marketing/application/service-3/storage/dynamodb-357",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-109?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-109"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}