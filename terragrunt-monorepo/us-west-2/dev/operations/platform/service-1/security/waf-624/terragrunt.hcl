include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/data/service-1/security/security-hub-817",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/compute/ec2-265",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/security/waf-875",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/application/event-bus-256",
    "../../../../../../../../us-east-1/staging/operations/application/service-1/network/endpoint-976",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-624?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-624"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}