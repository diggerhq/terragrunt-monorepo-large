include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/compute/ec2-833",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/monitoring/cloudwatch-61",
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/security/waf-565",
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/monitoring/cloudwatch-79",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-637?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-637"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}