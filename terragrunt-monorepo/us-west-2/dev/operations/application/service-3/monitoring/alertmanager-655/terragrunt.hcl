include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/application/service-2/monitoring/trace-collection-804",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/monitoring/cloudwatch-446",
    "../../../../../../../../us-west-2/qa/finance/platform/service-2/storage/rds-850",
    "../../../../../../../../us-east-1/qa/operations/platform/service-2/security/certificates-941",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-655?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-655"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}