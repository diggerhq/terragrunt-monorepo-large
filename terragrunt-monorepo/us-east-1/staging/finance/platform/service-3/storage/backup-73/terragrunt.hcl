include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/application/service-3/application/cache-layer-471",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/storage/backup-177",
    "../../../../../../../../us-east-1/staging/finance/application/service-3/compute/ec2-505",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/network/vpn-283",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-3/network/transit-gateway-238",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-73?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-73"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}