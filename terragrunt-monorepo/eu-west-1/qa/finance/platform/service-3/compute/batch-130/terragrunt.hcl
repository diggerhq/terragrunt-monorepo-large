include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/application/service-3/storage/s3-609",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/application/api-gateway-897",
    "../../../../../../../../us-east-1/qa/marketing/data/service-3/storage/elasticache-266",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-3/storage/backup-926",
    "../../../../../../../../us-east-1/qa/marketing/application/service-3/security/certificates-508",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-130?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-130"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}