include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/platform/service-3/security/shield-924",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-1/compute/fargate-144",
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/security/secrets-991",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-1/security/guardduty-922",
    "../../../../../../../../us-west-2/staging/finance/application/service-2/application/event-bus-859",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-297?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-297"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}