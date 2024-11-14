include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/data/service-1/security/secrets-130",
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/network/endpoint-989",
    "../../../../../../../../us-west-2/staging/finance/data/service-1/storage/efs-956",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/monitoring/cloudwatch-136",
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/storage/dynamodb-181",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-34?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-34"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}