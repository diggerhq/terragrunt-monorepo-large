include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/data/service-2/network/route-table-972",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/storage/dynamodb-222",
    "../../../../../../../../us-east-1/dev/operations/application/service-2/compute/fargate-814",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/application/queue-787",
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/network/route-table-730",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-57?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-57"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}