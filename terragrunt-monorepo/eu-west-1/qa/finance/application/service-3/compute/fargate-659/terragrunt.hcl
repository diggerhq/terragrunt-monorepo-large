include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/storage/redshift-732",
    "../../../../../../../../eu-west-1/dev/finance/application/service-1/application/api-gateway-335",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/storage/dynamodb-356",
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/monitoring/alertmanager-311",
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/compute/ec2-443",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fargate-659?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fargate-659"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}