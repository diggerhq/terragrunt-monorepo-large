include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/platform/service-3/security/iam-571",
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/storage/backup-172",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-3/monitoring/trace-collection-203",
    "../../../../../../../../us-east-1/dev/operations/data/service-1/security/kms-438",
    "../../../../../../../../us-east-1/qa/operations/platform/service-2/network/endpoint-780",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-203?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-203"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}