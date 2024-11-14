include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/network/endpoint-911",
    "../../../../../../../../us-east-1/dev/operations/application/service-3/compute/fargate-126",
    "../../../../../../../../us-west-2/qa/marketing/application/service-1/security/waf-393",
    "../../../../../../../../us-east-1/dev/operations/data/service-2/compute/ecs-834",
    "../../../../../../../../us-west-2/staging/operations/platform/service-1/storage/dynamodb-377",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-887?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-887"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}