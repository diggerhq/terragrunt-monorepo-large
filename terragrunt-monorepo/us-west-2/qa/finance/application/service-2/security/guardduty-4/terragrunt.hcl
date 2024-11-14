include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/platform/service-1/compute/ec2-966",
    "../../../../../../../../us-east-1/dev/finance/application/service-2/application/cache-layer-793",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/compute/batch-317",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/storage/elasticache-728",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/security/waf-563",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-4?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-4"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}