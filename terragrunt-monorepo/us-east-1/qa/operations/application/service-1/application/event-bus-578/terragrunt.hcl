include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/data/service-2/compute/fargate-997",
    "../../../../../../../../us-west-2/dev/finance/data/service-2/security/shield-148",
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/monitoring/alertmanager-661",
    "../../../../../../../../us-west-2/qa/finance/data/service-3/storage/efs-159",
    "../../../../../../../../us-east-1/staging/marketing/data/service-1/network/endpoint-409",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-578?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-578"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}