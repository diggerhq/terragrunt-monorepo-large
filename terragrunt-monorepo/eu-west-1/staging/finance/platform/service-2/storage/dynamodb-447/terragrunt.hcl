include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/application/cache-layer-87",
    "../../../../../../../../us-east-1/qa/operations/application/service-1/compute/ec2-726",
    "../../../../../../../../us-east-1/dev/operations/platform/service-2/storage/dynamodb-913",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-447?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-447"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}