include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/platform/service-1/monitoring/cloudwatch-755",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/storage/dynamodb-223",
    "../../../../../../../../us-west-2/qa/operations/data/service-1/monitoring/cloudwatch-397",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/compute/fargate-511",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-189?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-189"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}