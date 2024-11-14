include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/compute/spot-fleet-86",
    "../../../../../../../../us-east-1/qa/marketing/application/service-3/security/kms-500",
    "../../../../../../../../us-west-2/qa/operations/application/service-3/network/endpoint-937",
    "../../../../../../../../us-east-1/qa/operations/platform/service-2/monitoring/cloudwatch-970",
    "../../../../../../../../us-east-1/dev/finance/platform/service-2/monitoring/cloudwatch-22",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-348?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-348"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}