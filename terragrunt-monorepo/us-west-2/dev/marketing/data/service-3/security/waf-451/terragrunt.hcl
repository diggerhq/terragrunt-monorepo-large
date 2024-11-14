include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/platform/service-2/security/waf-295",
    "../../../../../../../../us-east-1/qa/operations/application/service-1/compute/spot-fleet-885",
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/network/direct-connect-480",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-3/compute/ec2-239",
    "../../../../../../../../us-east-1/staging/finance/application/service-1/network/endpoint-380",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-451?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-451"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}