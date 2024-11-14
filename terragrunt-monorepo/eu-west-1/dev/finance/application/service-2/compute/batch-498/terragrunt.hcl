include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/application/service-2/application/load-balancer-675",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-1/storage/efs-369",
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/monitoring/alertmanager-798",
    "../../../../../../../../us-west-2/dev/operations/application/service-3/compute/lambda-688",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-498?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-498"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}