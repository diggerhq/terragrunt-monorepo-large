include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/security/kms-314",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/compute/ec2-563",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-2/application/queue-156",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/network/transit-gateway-338",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-52?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-52"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}