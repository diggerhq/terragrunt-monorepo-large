include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-2/security/secrets-134",
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/storage/fsx-552",
    "../../../../../../../../us-west-2/qa/operations/application/service-3/monitoring/prometheus-654",
    "../../../../../../../../us-west-2/qa/finance/data/service-3/monitoring/cloudwatch-441",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//iam-465?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "iam-465"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}