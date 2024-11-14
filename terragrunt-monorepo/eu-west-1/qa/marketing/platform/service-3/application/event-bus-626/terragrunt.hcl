include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/application/queue-505",
    "../../../../../../../../us-east-1/qa/marketing/data/service-2/security/certificates-872",
    "../../../../../../../../us-west-2/qa/finance/data/service-1/monitoring/log-aggregation-836",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/application/event-bus-923",
    "../../../../../../../../us-west-2/qa/finance/platform/service-1/network/subnet-164",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-626?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-626"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}