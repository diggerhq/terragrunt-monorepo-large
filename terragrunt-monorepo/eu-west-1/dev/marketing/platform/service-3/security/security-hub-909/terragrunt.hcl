include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/compute/batch-603",
    "../../../../../../../../us-west-2/qa/operations/data/service-3/security/certificates-706",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/monitoring/trace-collection-524",
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/storage/rds-998",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/compute/ec2-833",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-909?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-909"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}