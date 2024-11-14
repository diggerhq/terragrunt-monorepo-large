include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/application/service-1/network/route-table-328",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/compute/batch-208",
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/storage/elasticache-976",
    "../../../../../../../../us-west-2/qa/finance/platform/service-2/compute/ec2-828",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/application/event-bus-256",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fargate-715?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fargate-715"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}