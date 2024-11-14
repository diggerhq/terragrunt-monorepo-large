include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/data/service-1/security/shield-592",
    "../../../../../../../../us-east-1/staging/marketing/application/service-2/storage/rds-788",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-3/network/route-table-782",
    "../../../../../../../../us-west-2/staging/operations/application/service-3/application/service-mesh-795",
    "../../../../../../../../eu-west-1/dev/finance/data/service-3/storage/s3-461",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-167?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-167"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}