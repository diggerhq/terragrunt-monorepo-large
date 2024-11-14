include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/platform/service-1/compute/ec2-297",
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/compute/fargate-220",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-2/compute/lambda-985",
    "../../../../../../../../us-east-1/dev/finance/data/service-3/compute/spot-fleet-387",
    "../../../../../../../../us-west-2/staging/operations/data/service-3/storage/dynamodb-150",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-399?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-399"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}