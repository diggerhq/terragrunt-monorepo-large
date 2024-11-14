include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-3/monitoring/prometheus-419",
    "../../../../../../../../us-west-2/qa/marketing/data/service-3/network/subnet-408",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-3/security/certificates-858",
    "../../../../../../../../us-west-2/qa/finance/application/service-1/storage/s3-742",
    "../../../../../../../../us-east-1/qa/finance/data/service-3/monitoring/trace-collection-51",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-213?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-213"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}