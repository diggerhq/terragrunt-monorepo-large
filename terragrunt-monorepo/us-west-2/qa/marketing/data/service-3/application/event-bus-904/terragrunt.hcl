include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/data/service-2/storage/dynamodb-470",
    "../../../../../../../../us-west-2/qa/marketing/application/service-1/application/load-balancer-345",
    "../../../../../../../../eu-west-1/qa/operations/application/service-1/compute/fargate-57",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/storage/backup-917",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-904?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-904"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}