include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/compute/ecs-830",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-3/security/guardduty-532",
    "../../../../../../../../us-west-2/staging/finance/platform/service-2/network/transit-gateway-703",
    "../../../../../../../../us-east-1/staging/marketing/data/service-1/compute/auto-scaling-496",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-563?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-563"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}