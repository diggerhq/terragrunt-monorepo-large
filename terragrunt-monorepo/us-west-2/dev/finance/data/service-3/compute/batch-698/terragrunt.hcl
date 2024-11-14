include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/monitoring/alertmanager-780",
    "../../../../../../../../us-west-2/qa/operations/application/service-3/application/queue-150",
    "../../../../../../../../us-west-2/qa/finance/data/service-3/compute/fargate-843",
    "../../../../../../../../us-east-1/staging/operations/data/service-1/compute/spot-fleet-766",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-698?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-698"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}