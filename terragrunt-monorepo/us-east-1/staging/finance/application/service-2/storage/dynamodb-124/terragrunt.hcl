include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/platform/service-2/application/service-mesh-281",
    "../../../../../../../../us-east-1/dev/finance/data/service-3/network/direct-connect-11",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/compute/ec2-521",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-124?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-124"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}