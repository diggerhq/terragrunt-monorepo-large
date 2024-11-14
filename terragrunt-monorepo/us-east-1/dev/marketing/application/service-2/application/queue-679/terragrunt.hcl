include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/application/service-1/storage/redshift-65",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/network/nacl-935",
    "../../../../../../../../us-east-1/staging/finance/application/service-3/security/guardduty-108",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-2/storage/s3-210",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-679?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-679"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}