include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/platform/service-3/network/transit-gateway-292",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-1/storage/backup-287",
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/security/waf-67",
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/network/endpoint-430",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-283?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-283"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}