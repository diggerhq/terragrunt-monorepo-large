include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/platform/service-2/security/kms-256",
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/security/certificates-597",
    "../../../../../../../../eu-west-1/dev/finance/application/service-3/storage/efs-378",
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/monitoring/log-aggregation-19",
    "../../../../../../../../us-east-1/staging/finance/application/service-3/application/queue-807",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//iam-374?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "iam-374"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}