include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/application/service-1/storage/efs-444",
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/monitoring/log-aggregation-956",
    "../../../../../../../../us-west-2/qa/operations/application/service-2/security/certificates-263",
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/storage/backup-29",
    "../../../../../../../../us-west-2/dev/marketing/application/service-3/monitoring/cloudwatch-469",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//nacl-533?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "nacl-533"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}