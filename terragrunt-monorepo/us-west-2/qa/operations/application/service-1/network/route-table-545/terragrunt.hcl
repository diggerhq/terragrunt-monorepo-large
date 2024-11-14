include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/application/load-balancer-382",
    "../../../../../../../../us-east-1/qa/marketing/application/service-3/storage/s3-1",
    "../../../../../../../../eu-west-1/dev/finance/application/service-2/compute/batch-498",
    "../../../../../../../../us-west-2/dev/finance/application/service-2/compute/lambda-833",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-3/application/queue-777",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-545?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-545"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}