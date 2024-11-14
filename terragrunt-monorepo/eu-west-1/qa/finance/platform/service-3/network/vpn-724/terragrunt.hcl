include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/application/service-2/security/security-hub-656",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/compute/spot-fleet-906",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/security/secrets-140",
    "../../../../../../../../us-east-1/dev/finance/data/service-2/storage/efs-496",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/application/api-gateway-792",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-724?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-724"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}