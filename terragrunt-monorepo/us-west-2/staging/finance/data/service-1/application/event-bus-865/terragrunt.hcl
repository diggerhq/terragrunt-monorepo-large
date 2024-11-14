include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/data/service-1/monitoring/cloudwatch-397",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/monitoring/prometheus-506",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/security/certificates-745",
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/compute/fargate-136",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-865?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-865"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}